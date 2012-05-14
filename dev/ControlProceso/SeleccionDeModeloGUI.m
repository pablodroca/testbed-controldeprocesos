function varargout = SeleccionDeModeloGUI(varargin)
% SELECCIONDEMODELOGUI M-file for SeleccionDeModeloGUI.fig
%      SELECCIONDEMODELOGUI, by itself, creates a new SELECCIONDEMODELOGUI or raises the existing
%      singleton*.
%
%      H = SELECCIONDEMODELOGUI returns the handle to a new SELECCIONDEMODELOGUI or the handle to
%      the existing singleton*.
%
%      SELECCIONDEMODELOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECCIONDEMODELOGUI.M with the given input arguments.
%
%      SELECCIONDEMODELOGUI('Property','Value',...) creates a new SELECCIONDEMODELOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SeleccionDeModeloGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SeleccionDeModeloGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SeleccionDeModeloGUI

% Last Modified by GUIDE v2.5 07-May-2012 03:22:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SeleccionDeModeloGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SeleccionDeModeloGUI_OutputFcn, ...
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


% --- Executes just before SeleccionDeModeloGUI is made visible.
function SeleccionDeModeloGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SeleccionDeModeloGUI (see VARARGIN)

% Choose default command line output for SeleccionDeModeloGUI
enableRadioButton(handles.rdManual, handles);
showConfiguracionManualControl(handles);
handles.output = hObject;
window.vista = hObject;
window.controlador = ControladorSeleccionDeModelo(handles.wSeleccionDeModelo);
setWindow('SeleccionDeModelo', window);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SeleccionDeModeloGUI wait for user response (see UIRESUME)
% uiwait(handles.wSeleccionDeModelo);


% --- Outputs from this function are returned to the command line.
function varargout = SeleccionDeModeloGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function A_yuda_Callback(hObject, eventdata, handles)
% hObject    handle to A_yuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Archivo_Callback(hObject, eventdata, handles)
% hObject    handle to Archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Conectar_Callback(hObject, eventdata, handles)
% hObject    handle to Conectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Desconectar_Callback(hObject, eventdata, handles)
% hObject    handle to Desconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ConfiguracionAvanzada_Callback(hObject, eventdata, handles)
% hObject    handle to ConfiguracionAvanzada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ConfiguracionAvanzadaGUI

% --------------------------------------------------------------------
function GuardarConfigDeControl_Callback(hObject, eventdata, handles)
% hObject    handle to GuardarConfigDeControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Salir_Callback(hObject, eventdata, handles)
% hObject    handle to Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EvaluarSalir(handles);


% --------------------------------------------------------------------
function Grabacion_Callback(hObject, eventdata, handles)
% hObject    handle to Grabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function AbrirGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to AbrirGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function IniciarGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to IniciarGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DetenerGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to DetenerGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rdDosTanques.
function rdDosTanques_Callback(hObject, eventdata, handles)
% hObject    handle to rdDosTanques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdDosTanques


% --- Executes on button press in rdUnTanque.
function rdUnTanque_Callback(hObject, eventdata, handles)
% hObject    handle to rdUnTanque (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdUnTanque


% --- Executes on button press in rdSensores420mA.
function rdSensores420mA_Callback(hObject, eventdata, handles)
% hObject    handle to rdSensores420mA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdSensores420mA


% --- Executes on button press in rdSensoresSiemens.
function rdSensoresSiemens_Callback(hObject, eventdata, handles)
% hObject    handle to rdSensoresSiemens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdSensoresSiemens


% --- Executes on button press in rdManual.
function rdManual_Callback(hObject, eventdata, handles)
% hObject    handle to rdManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdManual

toogleRadioButton(hObject,handles);
showConfiguracionManualControl(handles);

% --- Executes on button press in rdAutomaticoABB.
function rdAutomaticoABB_Callback(hObject, eventdata, handles)
% hObject    handle to rdAutomaticoABB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdAutomaticoABB

toogleRadioButton(hObject,handles);
showConfiguracionAutomaticaControl(handles);

% --- Executes on button press in rdAutomaticoMatlab.
function rdAutomaticoMatlab_Callback(hObject, eventdata, handles)
% hObject    handle to rdAutomaticoMatlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdAutomaticoMatlab
toogleRadioButton(hObject,handles);
showConfiguracionAutomaticaControl(handles);

% --- Executes on button press in btnConectar.
function btnConectar_Callback(hObject, eventdata, handles)
% hObject    handle to btnConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    [tipoSetDeControl, configuracion] = getTipoSetDeControlYConfiguracion(handles);
    modelo = getModelo(handles);
	try
        w = getWindow('SeleccionDeModelo');
        w.controlador = conectar(w.controlador, tipoSetDeControl, configuracion, modelo);
        setWindow('SeleccionDeModelo', w);
	catch 
        exception = lasterr;
        msgbox(sprintf('Ha ocurrido un error al conectarse con el set de control elegido. Revise que los elementos elegidos tengan la conectividad necesaria. \n\n%s', ...
            exception), 'Error al Conectar', 'error');
	end
catch
    exception = lasterr;
    msgbox(exception, 'Error de Parametro', 'error');
end
% --- Executes when user attempts to close wSeleccionDeModelo.
function wSeleccionDeModelo_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to wSeleccionDeModelo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
EvaluarSalir(handles);


function EvaluarSalir(handles)

user_response = questdlg('¿Desea salir del sistema?','Salir', 'Aceptar', 'Cancelar', 'Aceptar');
%user_response = ConfirmarSalidaGUI;
if user_response == 'Aceptar'
	    delete(handles.wSeleccionDeModelo);
%else doNothing    
end


% --- Executes on button press in rdReproduccion.
function rdReproduccion_Callback(hObject, eventdata, handles)
% hObject    handle to rdReproduccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
toogleRadioButton(hObject,handles);
showConfiguracionAutomaticaControl(handles);

% Hint: get(hObject,'Value') returns toggle state of rdReproduccion
function enableRadioButton(radioToEnable, handles)
    radioHandles = getOtrosRadiosSetDeControl(handles, radioToEnable);
    set(radioHandles, 'Value', get(radioToEnable, 'Min'));
    set(radioToEnable, 'Value', get(radioToEnable, 'Max'));
end

function toogleRadioButton(hObject, handles)
    if get(hObject, 'Value') == get(hObject, 'Max')
        radioHandles = getOtrosRadiosSetDeControl(handles, hObject);
        set(radioHandles, 'Value', get(hObject, 'Min'));
    end
end

function hideConfiguracionManualControl(handles)
    controls = getFrameControlManualHandles(handles);
    set(controls, 'Visible', 'off');
end

function hideConfiguracionAutomaticaControl(handles)
    controls = [handles.lblValoresIniciales handles.btnAbrirConfiguracion getFrameControlHandles(handles) getFramePIDHandles(handles)];
    set(controls, 'Visible', 'off');
end

function showConfiguracionManualControl(handles)
    controls = getFrameControlManualHandles(handles);
    set(controls, 'Visible', 'on');
    hideConfiguracionAutomaticaControl(handles);
end

function showConfiguracionAutomaticaControl(handles)
    controls = [handles.lblValoresIniciales handles.btnAbrirConfiguracion getFrameControlHandles(handles) getFramePIDHandles(handles)];
    set(controls, 'Visible', 'on');
    hideConfiguracionManualControl(handles);
end

function controls = getFrameControlManualHandles(handles)
    controls = [];
end
function controls = getFrameControlHandles(handles)
    controls = [handles.frmControl, handles.lblSetPoint, handles.txtSetPoint, handles.lblBias, handles.txtBias];
end
function controls = getFramePIDHandles(handles)
    controls = [handles.frmPID, handles.lblKp, handles.txtKp, handles.lblKi, handles.txtKi, handles.lblKd, handles.txtKd];
end

function radioHandles = getOtrosRadiosSetDeControl(handles, radioActual)
    radioHandles = [handles.rdManual, handles.rdAutomaticoABB, handles.rdAutomaticoMatlab, handles.rdReproduccion];
    iiRadioActual = find(radioHandles == radioActual);
    radioHandles = radioHandles([1:iiRadioActual-1, iiRadioActual+1:length(radioHandles)]);
    
end

function [tipo, configuracion] = getTipoSetDeControlYConfiguracion(handles)
	if get(handles.rdManual, 'Value') == get(handles.rdManual, 'Max')
        tipo = 'Manual';
        configuracion = recolectarConfiguracionManual(handles);
	elseif get(handles.rdAutomaticoABB, 'Value') == get(handles.rdAutomaticoABB, 'Max')
        tipo = 'AutomaticoABB';
        configuracion = recolectarConfiguracionAutomatica(handles);
	elseif get(handles.rdAutomaticoMatlab, 'Value') == get(handles.rdAutomaticoMatlab, 'Max')
        tipo = 'AutomaticoMatlab';
        configuracion = recolectarConfiguracionAutomatica(handles);
	elseif get(handles.rdReproduccion, 'Value') == get(handles.rdReproduccion, 'Max')
        tipo = 'Reproduccion';
        configuracion = recolectarConfiguracionAutomatica(handles);
	end
end

function modelo = getModelo(handles)

	if get(handles.rdUnTanque, 'Value') == get(handles.rdUnTanque, 'Max')
        modelo = 'UnTanque';
    elseif get(handles.rdDosTanques, 'Value') == get(handles.rdDosTanques, 'Max')
        modelo = 'DosTanque';
    else
        error('SeleccionDeModelo:modelo', 'El modelo seleccionado no corresponde niguno de los modelos disponibles.');
    end
end
    
function configuracion = recolectarConfiguracionAutomatica(handles)
    setPoint = str2num(get(handles.txtSetPoint, 'String'));
    bias = str2num(get(handles.txtBias, 'String'));
    kp = str2num(get(handles.txtKp, 'String'));
    ki = str2num(get(handles.txtKi, 'String'));
    kd = str2num(get(handles.txtKd, 'String'));
	if isempty(setPoint)
		error('SeleccionDeModelo:parametros','El valor de Set Point ingresado no es valido. Por favor ingrese un valor numerico');
	elseif isempty(bias)
		error('SeleccionDeModelo:parametros','El valor de Bias ingresado no es valido. Por favor ingrese un valor numerico');
    elseif isempty(kp)
		error('SeleccionDeModelo:parametros','El valor de Kp ingresado no es valido. Por favor ingrese un valor numerico');
    elseif isempty(ki)
		error('SeleccionDeModelo:parametros','El valor de Ki ingresado no es valido. Por favor ingrese un valor numerico');
    elseif isempty(kd)
		error('SeleccionDeModelo:parametros','El valor de Kd ingresado no es valido. Por favor ingrese un valor numerico');
    else
        configuracion = ConfiguracionControlAutomatico(setPoint, bias, kp, ki, kd);
    end
end


function configuracion = recolectarConfiguracionManual(handles)
    valorActuador = str2num(get(handles.txtValorActuador, 'String'));
	if isempty(valorActuador)
		error('SeleccionDeModelo:parametros','El Valor del Actuador ingresado no es valido. Por favor ingrese un valor numerico');
    else
        configuracion = ConfiguracionControlManual(valorActuador);
    end
end
% --- Executes during object creation, after setting all properties.
function txtKp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtKp (see GCBO)
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


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
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
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


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


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
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
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
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
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


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


% --- Executes during object creation, after setting all properties.
function txtValorActuador_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtValorActuador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function txtValorActuador_Callback(hObject, eventdata, handles)
% hObject    handle to txtValorActuador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtValorActuador as text
%        str2double(get(hObject,'String')) returns contents of txtValorActuador as a double


% --- Executes on button press in btnAbrirConfiguracion.
function btnAbrirConfiguracion_Callback(hObject, eventdata, handles)
% hObject    handle to btnAbrirConfiguracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


