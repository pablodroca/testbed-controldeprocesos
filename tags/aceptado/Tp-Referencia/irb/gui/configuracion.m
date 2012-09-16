function varargout = configuracion(varargin)
% CONFIGURACION Application M-file for configuracion.fig
%    FIG = CONFIGURACION launch configuracion GUI.
%    CONFIGURACION('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 16-Nov-2006 01:32:00
if ( nargin == 0 |  ( nargin == 1 ) )  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
    handles.appData = varargin{1};
    handles.appData.current = 0;
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
function varargout = edit1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit1.
%disp('edit1 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = edit2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit2.
%disp('edit2 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = edit3_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit3.
%disp('edit3 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = edit4_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.edit4.
%disp('edit4 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = checkbox2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.checkbox2.
%disp('checkbox2 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = checkbox3_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.checkbox3.
%disp('checkbox3 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = checkbox4_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.checkbox4.
%disp('checkbox4 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = radiobutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.radiobutton1.
%disp('radiobutton1 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = radiobutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.radiobutton2.
%disp('radiobutton2 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = radiobutton3_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.radiobutton3.
%disp('radiobutton3 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = checkbox5_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.checkbox5.
%disp('checkbox5 Callback not implemented yet.')


% --------------------------------------------------------------------
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton1.
%disp('pushbutton1 Callback not implemented yet.')
close(handles.figureConfiguracion);


% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
%disp('pushbutton2 Callback not implemented yet.')
close(handles.figureConfiguracion);