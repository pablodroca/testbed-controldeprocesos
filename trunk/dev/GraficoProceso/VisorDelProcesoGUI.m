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

% Last Modified by GUIDE v2.5 18-Apr-2012 01:37:18

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
if length(varargin) < 2
    delete (handles.wVisorDelProceso);
    error('testbed:VisorDelProceso', strcat('Visor Del Proceso requiere 2 parametros. Ejemplo de ejecucion: ' ...
            , 'VisorDelProceso(wSeleccionDelProceso, proceso)'));
end

wSeleccionDeModelo = varargin{1};
proceso = varargin{2};
if (~ishandle(wSeleccionDeModelo)) || ...
    (~isobject(proceso)) 
    delete (handles.wVisorDelProceso);
    error('testbed:VisorDelProceso', 'Error al abrir el Visor Del Proceso sin una Seleccion del Modelo o un Proceso Valido');
end

handles.axesMuestras = handles.axesVisorProceso;
handles.wSeleccionDeModelo = wSeleccionDeModelo;
window.vista = hObject;
window.controlador = ControladorVisorDelProceso(handles.wVisorDelProceso, proceso);
setWindow('VisorDelProceso', window);
window.controlador = iniciar(window.controlador);
setWindow('VisorDelProceso', window);
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = VisorDelProcesoGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
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
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
msgbox('This is slider2');

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
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
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
msgbox('This is slider3');

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
msgbox('This is edit2');

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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
function txtMuestra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMuestra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtMuestra_Callback(hObject, eventdata, handles)
% hObject    handle to txtMuestra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMuestra as text
%        str2double(get(hObject,'String')) returns contents of txtMuestra as a double

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
desconectarControlador;

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
[filename, filepath] = uiputfile({'*.mat'}, 'Seleccionar archivo de grabacion...', 'Grabaciones/proceso.mat');
if filename
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
	msgbox('El proceso ha sido grabado correctamente.', 'Grabacion Finalizada', 'modal');
catch
	err = lasterr;
	msgbox(sprintf('Ha ocurrido un error durante la grabacion.%s\n', err), 'Error de Grabacion', 'error', 'modal');
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
		setWindow('VisorDelProceso', w);
	catch
		err = lasterr;
		msgbox(sprintf('Ha ocurrido un error durante la desconexion.%s\n', err), 'Error durante Desconexion', 'error', 'modal');
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

