function varargout = grafico(varargin)
% GRAFICO Application M-file for grafico.fig
%    FIG = GRAFICO launch grafico GUI.
%    GRAFICO('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 15-Nov-2006 22:45:39

if ( nargin == 0 |  ( nargin == 1 ) )  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
    handles.appData=varargin{1};
    handles.appData.current = 1;
    
	guidata(fig, handles);

	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
	catch
		disp(lasterr);
	end

end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and 
%| sets objects' callback properties to call them through the FEVAL 
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.

% --------------------------------------------------------------------
function varargout = pushbuttonStart_Callback(h, eventdata, handles, varargin)

%reset(handles.figTrayectoria);

view(handles.axesTrayectoria,20,30);

xmin = min(handles.appData.datos(:,3));
xmax = max(handles.appData.datos(:,3));

ymin = min(handles.appData.datos(:,4));
ymax = max(handles.appData.datos(:,4));

zmin = min(handles.appData.datos(:,5));
zmax = max(handles.appData.datos(:,5));

axis( handles.axesTrayectoria, [ xmin xmax ymin ymax zmin zmax ] );

fig = plot3(handles.appData.datos(1:1,3),handles.appData.datos(1:1,4),handles.appData.datos(1:1,5),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b','Parent',handles.axesTrayectoria);

i = handles.appData.current;

while i <= size(handles.appData.datos,1)
    
    fig = plot3(handles.appData.datos(1:i,3),handles.appData.datos(1:i,4),handles.appData.datos(1:i,5),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b','Parent',handles.axesTrayectoria);

    pause(0.300);
   
    i = i+1;
    handles.appData.current = i;
    
    if handles.appData.pausa == 1
        guidata(h,handles); % store the changes...
        return;
    end 
end

guidata(h,handles); % store the changes...


function varargout = callPushPausa(h, eventdata, handles, varargin)
handles.appData.pausa=1-handles.appData.pausa;
guidata(h,handles); % store the changes...


function varargout = callPushStop(h, eventdata, handles, varargin)
view(handles.axesTrayectoria,20,30);

handles.appData.current = 0;

i = 1;

xmin = min(handles.appData.datos(:,3));
xmax = max(handles.appData.datos(:,3));

ymin = min(handles.appData.datos(:,4));
ymax = max(handles.appData.datos(:,4));

zmin = min(handles.appData.datos(:,5));
zmax = max(handles.appData.datos(:,5));

axis( handles.axesTrayectoria, [ xmin xmax ymin ymax zmin zmax ] );

h = plot3(handles.appData.datos(:,3),handles.appData.datos(:,4),handles.appData.datos(:,5),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b','Parent',handles.axesTrayectoria);

guidata(h,handles); % store the changes...

