function varargout = VisorDelProcesoGUI(varargin)
% VISORDELPROCESOGUI M-file for VisorDelProcesoGUI.fig
%      VISORDELPROCESOGUI, by itself, creates a new VISORDELPROCESOGUI or raises the existing
%      singleton*.
%
%      H = VISORDELPROCESOGUI returns the handle to a new VISORDELPROCESOGUI or the handle to
%      the existing singleton*.
%
%      VISORDELPROCESOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISORDELPROCESOGUI.M with the given input arguments.
%
%      VISORDELPROCESOGUI('Property','Value',...) creates a new VISORDELPROCESOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VisorDelProcesoGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VisorDelProcesoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VisorDelProcesoGUI

% Last Modified by GUIDE v2.5 25-Jun-2012 01:40:24


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VisorDelProcesoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @VisorDelProcesoGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before VisorDelProcesoGUI is made visible.
function VisorDelProcesoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VisorDelProcesoGUI (see VARARGIN)

% Choose default command line output for VisorDelProcesoGUI
handles.output = hObject;
if length(varargin) < 4
    delete (handles.wVisorDelProceso);
    error('testbed:VisorDelProceso', strcat('Visor Del Proceso requiere 2 parametros. Ejemplo de ejecucion: ' ...
            , 'VisorDelProceso(wSeleccionDelProceso, proceso, archSimulink, tipoSetDeControl)'));
end

global directorioInicio;
[pic, map] = imread(strcat(directorioInicio, '\Imagenes\Desconectar.gif'));
image_rgb = ind2rgb(pic, map);
set(handles.btnDesconectar, 'String', '');
set(handles.btnDesconectar, 'cdata', image_rgb);

wSeleccionDeModelo = varargin{1};
proceso = varargin{2};
archivoSimulink = varargin{3};
tipoSetDeControl = varargin{4};

habilitarDeshabilitarControles(hObject, tipoSetDeControl);
    
window.vista = hObject;
window.controlador = ControladorVisorDelProceso(handles.wVisorDelProceso, proceso, tipoSetDeControl);
setWindow('VisorDelProceso', window);
try
    if (~ishandle(wSeleccionDeModelo)) || ...
            (~isobject(proceso)) 
        delete (handles.wVisorDelProceso);
        error('testbed:VisorDelProceso', 'Error al abrir el Visor Del Proceso sin una Seleccion del Modelo o un Proceso Valido');
    end
    
    if strcmp(tipoSetDeControl, 'Reproduccion')
        mostrarCuadroComentario(hObject);
        set(handles.txtComentario, 'Enable', 'off');
        set(handles.btnAgregarComentario, 'Enable', 'off');
    else
        ocultarCuadroComentario(hObject);
    end
    
    imagenProceso = imread(strcat(archivoSimulink, '.jpg'));
    image(imagenProceso, 'Parent', handles.axesImagen);
    axis(handles.axesImagen, 'off');
    
    rectangle('Position', [0 0 20 100], 'Curvature', [0.1 0.1], 'FaceColor', [1 1 1]*206/255, 'Parent', handles.axesBarraTanque);
    axis(handles.axesBarraTanque, 'off');
    
    global configuracionAvanzada;
    config = configuracionAvanzada;
    maxValueX = getEjeTemporal(config);
    xlim(handles.axesVisorProceso, [0 maxValueX]);
    ylim(handles.axesVisorProceso, [getNivelMinimo(config) getNivelMaximo(config)]);
    
    
    set(handles.axesVisorProceso,'YGrid', 'on');
    set(get(handles.axesVisorProceso,'XLabel'), 'String', 'Tiempo [seg.]');
    set(get(handles.axesVisorProceso,'YLabel'), 'String', 'Nivel [%]');
    
    inicializarLimitesEnBarrasDeControl(handles);
    refrescarValoresConfiguracionControl(handles);
    
    handles.tipoSetDeControl = tipoSetDeControl;
    handles.wSeleccionDeModelo = wSeleccionDeModelo;
    window.controlador = iniciar(window.controlador);
    setWindow('VisorDelProceso', window);
    guidata(hObject, handles);
catch
    exception = lasterr;
    msgboxException('Ha ocurrido un error durante la iniciacion del Proceso. El set de control sera desconectado.', 'Error durante la iniciacion', exception);
    desconectarControlador;
    delete(handles.wVisorDelProceso);
end




% --- Outputs from this function are returned to the command line.
function varargout = VisorDelProcesoGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function txtKp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtKp_Callback(hObject, eventdata, handles)
% hObject    handle to txtKp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtKp as text
%        str2double(get(hObject,'String')) returns contents of txtKp as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtKp, 'String');
[w.controlador, valido] = modificarParametroKp(w.controlador, valorStr);
if valido
   set(handles.slKp, 'Value', str2double(valorStr));
else
    set(handles.txtKp, 'String', num2str(get(handles.slKp, 'Value')));
end
setWindow('VisorDelProceso', w);





% --- Executes during object creation, after setting all properties.
function txtKi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtKi_Callback(hObject, eventdata, handles)
% hObject    handle to txtKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtKi as text
%        str2double(get(hObject,'String')) returns contents of txtKi as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtKi, 'String');
[w.controlador, valido] = modificarParametroKi(w.controlador, valorStr);
if valido
   set(handles.slKi, 'Value', str2double(valorStr));
else
    set(handles.txtKi, 'String', num2str(get(handles.slKi, 'Value')));
end
setWindow('VisorDelProceso', w);

% --- Executes during object creation, after setting all properties.
function txtKd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtKd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtKd_Callback(hObject, eventdata, handles)
% hObject    handle to txtKd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtKd as text
%        str2double(get(hObject,'String')) returns contents of txtKd as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtKd, 'String');
[w.controlador, valido] = modificarParametroKd(w.controlador, valorStr);
if valido
   set(handles.slKd, 'Value', str2double(valorStr));
else
    set(handles.txtKd, 'String', num2str(get(handles.slKd, 'Value')));
end
setWindow('VisorDelProceso', w);

% --- Executes during object creation, after setting all properties.
function txtNivel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtNivel_Callback(hObject, eventdata, handles)
% hObject    handle to txtNivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNivel as text
%        str2double(get(hObject,'String')) returns contents of txtNivel as a double


% --- Executes during object creation, after setting all properties.
function txtInstante_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInstante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtInstante_Callback(hObject, eventdata, handles)
% hObject    handle to txtInstante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInstante as text
%        str2double(get(hObject,'String')) returns contents of txtInstante as a double

% --------------------------------------------------------------------
function Archivo_Callback(hObject, eventdata, handles)
% hObject    handle to Archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Desconectar_Callback(hObject, eventdata, handles)
% hObject    handle to Desconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

desconectarControlador;
delete(handles.wVisorDelProceso);


% --------------------------------------------------------------------
function Grabacion_Callback(hObject, eventdata, handles)
% hObject    handle to Grabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function IniciarGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to IniciarGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global directorioInicio;
[filename, filepath] = uiputfile({'*.mat'}, 'Seleccionar archivo de grabacion...', strcat(directorioInicio, '/Grabaciones/proceso.mat'));
if filename
    set(handles.IniciarGrabacion, 'Enable', 'off');
    set(handles.FinalizarGrabacion, 'Enable', 'on');
    set(handles.lstComentarios, 'String', {});
    w = getWindow('VisorDelProceso');
	w.controlador = comenzarGrabacion(w.controlador, strcat(filepath,filename));
    setWindow('VisorDelProceso', w);
end

% --------------------------------------------------------------------
function FinalizarGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to FinalizarGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    w = getWindow('VisorDelProceso');
	w.controlador = finalizarGrabacion(w.controlador);
    setWindow('VisorDelProceso', w);
    set(handles.IniciarGrabacion, 'Enable', 'off');
    set(handles.FinalizarGrabacion, 'Enable', 'off');
	msgbox('El proceso ha sido grabado correctamente.', 'Grabacion Finalizada', 'modal');
catch
    exception = lasterr;
    msgboxException('Ha ocurrido un error durante la grabacion.', 'Error de Grabacion', exception);
end


% --- Executes when user attempts to close wVisorDelProceso.
function wVisorDelProceso_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to wVisorDelProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
user_response = questdlg('Desea salir del Visor Del Proceso y desconectar el modelo actual?','Desconectar Modelo', 'Aceptar', 'Cancelar', 'Aceptar');
%user_response = ConfirmarSalidaGUI;
if user_response == 'Aceptar'
	desconectarControlador;
	delete(hObject);
%else doNothing    
end


function desconectarControlador()
	try
        w = getWindow('VisorDelProceso');
		w.controlador = desconectar(w.controlador);
        w.controlador = {};
		setWindow('VisorDelProceso', w);
	catch
        exception = lasterr;
        msgboxException('Ha ocurrido un error durante la desconexion.', 'Error durante Desconexion', exception);
	end
end


% --------------------------------------------------------------------
function CancelarGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to CancelarGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)	
	w = getWindow('VisorDelProceso');
	w.controlador = cancelarGrabacion(w.controlador);
	setWindow('VisorDelProceso', w);
end




% --- Executes during object creation, after setting all properties.
function slKp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slKp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slKp_Callback(hObject, eventdata, handles)
% hObject    handle to slKp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

w = getWindow('VisorDelProceso');
valor = get(handles.slKp, 'Value');
[w.controlador, valido] = modificarParametroKp(w.controlador, valor);
if valido
    set(handles.txtKp, 'String', num2str(valor));
else
   set(handles.slKp, 'Value', str2double(get(handles.txtKp, 'String')));
end
setWindow('VisorDelProceso', w);

% --- Executes during object creation, after setting all properties.
function slKi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slKi_Callback(hObject, eventdata, handles)
% hObject    handle to slKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

w = getWindow('VisorDelProceso');
valor = get(handles.slKi, 'Value');
[w.controlador, valido] = modificarParametroKi(w.controlador, valor);
if valido
    set(handles.txtKi, 'String', num2str(valor));
else
   set(handles.slKi, 'Value', str2double(get(handles.txtKi, 'String')));
end
setWindow('VisorDelProceso', w);

% --- Executes during object creation, after setting all properties.
function slKd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slKd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slKd_Callback(hObject, eventdata, handles)
% hObject    handle to slKd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

w = getWindow('VisorDelProceso');
valor = get(handles.slKd, 'Value');
[w.controlador, valido] = modificarParametroKd(w.controlador, valor);
if valido
    set(handles.txtKd, 'String', num2str(valor));
else
   set(handles.slKd, 'Value', str2double(get(handles.txtKd, 'String')));
end
setWindow('VisorDelProceso', w);


% --- Executes during object creation, after setting all properties.
function slSetPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slSetPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slSetPoint_Callback(hObject, eventdata, handles)
% hObject    handle to slSetPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

w = getWindow('VisorDelProceso');
valor = get(handles.slSetPoint, 'Value');
[w.controlador, valido] = modificarParametroSetPoint(w.controlador, valor);
if valido
    set(handles.txtSetPoint, 'String', num2str(valor));
else
   set(handles.slSetPoint, 'Value', str2double(get(handles.txtSetPoint, 'String')));
end
setWindow('VisorDelProceso', w);

% --- Executes during object creation, after setting all properties.
function slBias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slBias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slBias_Callback(hObject, eventdata, handles)
% hObject    handle to slBias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


w = getWindow('VisorDelProceso');
valor = get(handles.slBias, 'Value');
[w.controlador, valido] = modificarParametroBias(w.controlador, valor);
if valido
    set(handles.txtBias, 'String', num2str(valor));
else
   set(handles.slBias, 'Value', str2double(get(handles.txtBias, 'String')));
end
setWindow('VisorDelProceso', w);


% --- Executes during object creation, after setting all properties.
function txtSetPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSetPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtSetPoint_Callback(hObject, eventdata, handles)
% hObject    handle to txtSetPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSetPoint as text
%        str2double(get(hObject,'String')) returns contents of txtSetPoint as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtSetPoint, 'String');
[w.controlador, valido] = modificarParametroSetPoint(w.controlador, valorStr);
if valido
   set(handles.slSetPoint, 'Value', str2double(valorStr));
else
    set(handles.txtSetPoint, 'String', num2str(get(handles.slSetPoint, 'Value')));
end
setWindow('VisorDelProceso', w);



% --- Executes during object creation, after setting all properties.
function txtBias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtBias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtBias_Callback(hObject, eventdata, handles)
% hObject    handle to txtBias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of txtBias as text
%        str2double(get(hObject,'String')) returns contents of txtBias as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtBias, 'String');
[w.controlador, valido] = modificarParametroBias(w.controlador, valorStr);
if valido
   set(handles.slBias, 'Value', str2double(valorStr));
else
    set(handles.txtBias, 'String', num2str(get(handles.slBias, 'Value')));
end
setWindow('VisorDelProceso', w);


w = getWindow('VisorDelProceso');
w.controlador = modificarParametro(w.controlador, 'Bias', 'Value', get(handles.txtBias, 'String'));
setWindow('VisorDelProceso', w);

function inicializarLimitesEnBarrasDeControl(handles)
set(handles.slSetPoint, 'Min', 0);
set(handles.slSetPoint, 'Max', 100);
set(handles.slBias, 'Min', 0);
set(handles.slBias, 'Max', 100);
set(handles.slKp, 'Min', 0);
set(handles.slKp, 'Max', 3);
set(handles.slKi, 'Min', 0);
set(handles.slKi, 'Max', 3);
set(handles.slKd, 'Min', 0);
set(handles.slKd, 'Max', 3);
set(handles.slManual, 'Min', 0);
set(handles.slManual, 'Max', 100);
end

function refrescarValoresConfiguracionControl(handles)
    global setDeControl;
    configuracion = getConfiguracion(setDeControl);
    if strcmp(class(configuracion), 'configuracioncontrolmanual')
        controls = [handles.lblSetPoint, handles.txtSetPoint, handles.slSetPoint, ...
                handles.lblBias, handles.txtBias, handles.slBias, handles.frSetPointBias, ...
                handles.lblKp, handles.txtKp, handles.slKp, ...
                handles.lblKi, handles.txtKi, handles.slKi, ...
                handles.lblKd, handles.txtKd, handles.slKd, handles.frKpKiKd];
        set(controls, 'Visible', 'off');
        set(handles.txtManual,'String', num2str(getSalidaManual(configuracion)));    
        set(handles.slManual,'Value', getSalidaManual(configuracion));        
    else
        controls = [handles.lblManual, handles.txtManual, handles.slManual, handles.frManual];
        set(controls, 'Visible', 'off');
        set(handles.txtSetPoint,'String', num2str(getSetPoint(configuracion)));
        set(handles.slSetPoint,'Value', getSetPoint(configuracion));
        set(handles.txtBias,'String', num2str(getBias(configuracion)));
        set(handles.slBias,'Value', getBias(configuracion));
        set(handles.txtKp,'String', num2str(getKp(configuracion)));
        set(handles.slKp,'Value', getKp(configuracion));
        set(handles.txtKi,'String', num2str(getKi(configuracion)));
        set(handles.slKi,'Value', getKi(configuracion));
        set(handles.txtKd,'String', num2str(getKd(configuracion)));
        set(handles.slKd,'Value', getKd(configuracion));
    end
end


% --- Executes during object creation, after setting all properties.
function slManual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slManual_Callback(hObject, eventdata, handles)
% hObject    handle to slManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


w = getWindow('VisorDelProceso');
valor = get(handles.slManual, 'Value');
[w.controlador, valido] = modificarParametroActuadorManual(w.controlador, valor);
if valido
    set(handles.txtManual, 'String', num2str(valor));
else
   set(handles.slManual, 'Value', str2double(get(handles.txtManual, 'String')));
end
setWindow('VisorDelProceso', w);


% --- Executes during object creation, after setting all properties.
function txtManual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtManual_Callback(hObject, eventdata, handles)
% hObject    handle to txtManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtManual as text
%        str2double(get(hObject,'String')) returns contents of txtManual as a double

w = getWindow('VisorDelProceso');
valorStr = get(handles.txtManual, 'String');
[w.controlador, valido] = modificarParametroActuadorManual(w.controlador, valorStr);
if valido
   set(handles.slManual, 'Value', str2double(valorStr));
else
    set(handles.txtManual, 'String', num2str(get(handles.slManual, 'Value')));
end
setWindow('VisorDelProceso', w);

% --------------------------------------------------------------------
function GuardarConfigDeControl_Callback(hObject, eventdata, handles)
% hObject    handle to GuardarConfigDeControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global directorioInicio;
[filename, filepath] = uiputfile({'*.mat'}, 'Seleccionar archivo de Configuracion...', strcat(directorioInicio, '/Configuraciones/configuracion.mat'));
if filename
    global setDeControl;
    configuracion = getConfiguracion(setDeControl);
    configuracion = guardar(configuracion, strcat(filepath, filename));
    tipoSetDeControl = handles.tipoSetDeControl;
    save(strcat(filepath, filename), '-append', 'tipoSetDeControl');
end


% --- Executes on button press in btnDesconectar.
function btnDesconectar_Callback(hObject, eventdata, handles)
% hObject    handle to btnDesconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
desconectarControlador;
delete(handles.wVisorDelProceso);


% --- Executes on mouse press over axes background.
function axesVisorProceso_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axesVisorProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

w = getWindow('VisorDelProceso');
abrirGrafico(w.controlador);



% --- Executes on button press in btnAgregarComentario.
function btnAgregarComentario_Callback(hObject, eventdata, handles)
% hObject    handle to btnAgregarComentario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

textoComentario = get(handles.txtComentario, 'String');
registrarCambioComentario(handles.visorDelProceso, textoComentario);
set(handles.txtComentario, 'String', '');

% --- Executes during object creation, after setting all properties.
function txtComentario_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtComentario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtComentario_Callback(hObject, eventdata, handles)
% hObject    handle to txtComentario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtComentario as text
%        str2double(get(hObject,'String')) returns contents of txtComentario as a double


% --- Executes during object creation, after setting all properties.
function txtLogComentarios_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLogComentarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtLogComentarios_Callback(hObject, eventdata, handles)
% hObject    handle to txtLogComentarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLogComentarios as text
%        str2double(get(hObject,'String')) returns contents of txtLogComentarios as a double


% --- Executes during object creation, after setting all properties.
function lstComentarios_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lstComentarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in lstComentarios.
function lstComentarios_Callback(hObject, eventdata, handles)
% hObject    handle to lstComentarios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns lstComentarios contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lstComentarios


% --- Executes during object creation, after setting all properties.
function txtActuador_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtActuador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtActuador_Callback(hObject, eventdata, handles)
% hObject    handle to txtActuador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtActuador as text
%        str2double(get(hObject,'String')) returns contents of txtActuador as a double


