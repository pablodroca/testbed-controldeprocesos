
function varargout = main(varargin)
% MAIN Application M-file for main.fig
%    FIG = MAIN launch main GUI.
%    MAIN('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 16-Nov-2006 02:27:29

if nargin == 0  % LAUNCH GUI
    
	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
    
    %Constantes
   
    %Contantes de estado    
    handles.appData.ESTADO_INICIAL = 0;
    handles.appData.ESTADO_EJECUCION = 1;
    handles.appData.ESTADO_SIMULACION = 2;
    handles.appData.ESTADO_PAUSA_EJECUCION = 3;
    handles.appData.ESTADO_PAUSA_SIMULACION = 4;
    handles.appData.ESTADO_ERROR = -1;

    %Constantes de datos
    handles.appData.CAMPON = 0;
    handles.appData.CAMPOT = 1;
    handles.appData.CAMPOX = 2;
    handles.appData.CAMPOY = 3;
    handles.appData.CAMPOZ = 4;

    handles.appData.CAMPOQ0 = 5;
    handles.appData.CAMPOQ1 = 6;
    handles.appData.CAMPOQ2 = 7;
    handles.appData.CAMPOQ3 = 8;

    handles.appData.CAMPOEXT = 9;
    
    handles.appData.INTERPOLACION_NULA=0;
    handles.appData.INTERPOLACION_LINEAL=1;
    handles.appData.INTEROLACION_SPLINE=2;
    
    %Archivo de configuracion
    handles.appData.ARCHIVO_CONFIGURACION='config.cfg';

    % Varibles de aplicacion

    % IO
    handles.appData.directorio='';
    handles.appData.archivo='';
    handles.appData.archivoModificado=0;

    % Parametros de configuracion
    handles.appData.invEjeX = 0;
    handles.appData.invEjeY = 0;
    handles.appData.invEjeZ = 0;
    handles.appData.anguloElevacion=0;
    handles.appData.anguloAzimutal=0;
    handles.appData.patronGrafica='';
    handles.appData.patronMarcador='';
    handles.appData.factorSimulacion=1;
    handles.appData.muestreo=100;
    handles.appData.muestrasOrientacion=10;
    handles.appData.pausa=0;

    % Variables de programa
    handles.appData.estado = handles.appData.ESTADO_INICIAL;
    
    handles.appData.datos = [];
                             
                             
                             
    handles.appData.datoActual = 0;
   
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

function varargout = callArchivoConfiguracion(h, eventdata, handles, varargin)
    configuracion(handles.appData);
% end %  function callArchivoConfiguracion

function varargout = callback_Salir(h, eventdata, handles, varargin)
    if (handles.appData.archivoModificado)
         respuesta = questdlg('El archivo no ha sido guardado. Esta seguro que desea salir?', 'Archivo modificado','Si','No','No');
        if respuesta == 'No'
            return;
        end
    end
close(handles.figureMain);
% end  % function callArchivoSalir

function varargout = callGraficoTrayectoria(h, eventdata, handles, varargin)
 [archivo, directorio] = uigetfile({'*.csv', 'Archivos CSV (*.csv)'; '*.*', 'Todos los archivos'}, 'Abrir archivo');
    if ~( isequal(archivo,0) | isequal(directorio,0) )
        handles.appData.directorioActual = directorio;
        handles.appData.archivoActual = archivo;
        handles.appData.datos = textread([ directorio archivo ],'','delimiter',',');
        guidata(h,handles);
    end

grafico(handles.appData);

function varargout = callGraficoCoordenadaX(h, eventdata, handles, varargin)
h = plot(handles.appData.datos(:,2),handles.appData.datos(:,3),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b');
title('Coordenada X en funcion del tiempo');
xlabel('Tiempo [mseg]');
ylabel('Desplazamiento [mm]');


function varargout = callGraficoCoordenadaY(h, eventdata, handles, varargin)
h = plot(handles.appData.datos(:,2),handles.appData.datos(:,4),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b');
title('Coordenada Y en funcion del tiempo');
xlabel('Tiempo [mseg]');
ylabel('Desplazamiento [mm]');

function varargout = callGraficoCoordenadaZ(h, eventdata, handles, varargin)
h = plot(handles.appData.datos(:,2),handles.appData.datos(:,5),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b');
title('Coordenada Z en funcion del tiempo');
xlabel('Tiempo [mseg]');
ylabel('Desplazamiento [mm]');

function varargout = callGraficoEjeExterno(h, eventdata, handles, varargin)
h = plot(handles.appData.datos(:,2),handles.appData.datos(:,10),'-b*','MarkerEdgeColor','r','MarkerFaceColor','b');
title('Giro Mesa en funcion del tiempo');
xlabel('Tiempo [mseg]');
ylabel('Giro [grados]');


function varargout = callback_IniciarSesion(h, eventdata, handles, varargin)
   [archivo, directorio] = uigetfile({'*.csv', 'Archivos CSV (*.csv)'; '*.*', 'Todos los archivos'}, 'Abrir archivo');
 
function varargout = callback_FinalizarSesion(h, eventdata, handles, varargin)


function varargout = callAyudaManualUso(h, eventdata, handles, varargin)
ayuda;


function varargout = callAyudaAcercaDe(h, eventdata, handles, varargin)
acercade;
