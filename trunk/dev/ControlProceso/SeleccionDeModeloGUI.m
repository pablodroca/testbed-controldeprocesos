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

% Last Modified by GUIDE v2.5 18-Jun-2012 19:53:26

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

global directorioInicio;
[pic, map] = imread(strcat(directorioInicio, '\Imagenes\ControlarPlanta.gif'));
image_rgb = ind2rgb(pic, map);
set(handles.btnControlarPlanta, 'String', '');
set(handles.btnControlarPlanta, 'cdata', image_rgb);
[pic, map] = imread(strcat(directorioInicio, '\Imagenes\AbrirGrabacion.gif'));
image_rgb = ind2rgb(pic, map);
set(handles.btnAbrirGrabacion, 'String', '');
set(handles.btnAbrirGrabacion, 'cdata', image_rgb);

position = get(handles.wSeleccionDeModelo, 'Position');
handles.originalHeight = position(4);

restablecerVisibilidadControlesPlanta(handles, 0);


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

ejecutarAbrirGrabacion(handles);

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


% --- Executes on button press in rdManual.
function rdManual_Callback(hObject, eventdata, handles)
% hObject    handle to rdManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdManual

toogleRadioButton(hObject,handles);
showConfiguracionManualControl(handles);

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
        msgboxException('Ha ocurrido un error al conectarse con el set de control elegido. Revise que los elementos elegidos tengan la conectividad necesaria.', ...
            'Error al Conectar', exception);
	end
catch
    exception = lasterr;
    msgboxException('Se ha detectado un error en los parametros.', 'Error de Parametro', exception);
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
if strcmp(user_response, 'Aceptar')
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
    controls = [getFrameControlHandles(handles) getFramePIDHandles(handles)];
    set(controls, 'Visible', 'off');
end

function showConfiguracionManualControl(handles)
    controls = getFrameControlManualHandles(handles);
    set(controls, 'Visible', 'on');
    hideConfiguracionAutomaticaControl(handles);
end

function showConfiguracionAutomaticaControl(handles)
    controls = [getFrameControlHandles(handles) getFramePIDHandles(handles)];
    set(controls, 'Visible', 'on');
    hideConfiguracionManualControl(handles);
end
function showTipoSetDeControl(handles)
    controls = [handles.frmTipoSetDeControl handles.lblTipoSetDeControl handles.rdManual handles.rdAutomaticoMatlab, handles.rdReproduccion handles.btnConectar];
    set(controls, 'Visible', 'on');
end
function hideTipoSetDeControl(handles)
    controls = [handles.frmTipoSetDeControl handles.lblTipoSetDeControl handles.rdManual handles.rdAutomaticoMatlab, handles.rdReproduccion handles.btnConectar];
    set(controls, 'Visible', 'off');
end
function controls = getFrameControlManualHandles(handles)
    controls = [handles.frmControlManual handles.txtManual handles.lblManual];
end
function controls = getFrameControlHandles(handles)
    controls = [handles.frmControl, handles.lblSetPoint, handles.txtSetPoint, handles.lblBias, handles.txtBias];
end
function controls = getFramePIDHandles(handles)
    controls = [handles.frmPID, handles.lblKp, handles.txtKp, handles.lblKi, handles.txtKi, handles.lblKd, handles.txtKd];
end

function radioHandles = getOtrosRadiosSetDeControl(handles, radioActual)
    radioHandles = [handles.rdManual, handles.rdAutomaticoMatlab, handles.rdReproduccion];
    iiRadioActual = find(radioHandles == radioActual);
    radioHandles = radioHandles([1:iiRadioActual-1, iiRadioActual+1:length(radioHandles)]);
    
end

function [tipo, configuracion] = getTipoSetDeControlYConfiguracion(handles)
	if get(handles.rdManual, 'Value') == get(handles.rdManual, 'Max')
        tipo = 'Manual';
        configuracion = recolectarConfiguracionManual(handles);
	elseif get(handles.rdAutomaticoMatlab, 'Value') == get(handles.rdAutomaticoMatlab, 'Max')
        tipo = 'AutomaticoMatlab';
        configuracion = recolectarConfiguracionAutomatica(handles);
	elseif get(handles.rdReproduccion, 'Value') == get(handles.rdReproduccion, 'Max')
        tipo = 'Reproduccion';
        configuracion = recolectarConfiguracionAutomatica(handles);
	end
end

function [tipo, configuracion] = setTipoSetDeControlYConfiguracionDeGrabacion(handles, archivo, tipo)
   if strcmp(tipo, 'Manual')
        configuracion = ConfiguracionControlManual;
        configuracion = restaurar(configuracion, archivo);
        radioToEnable = handles.rdManual;
        showConfiguracionManualControl(handles);
        establecerConfiguracionManual(handles, configuracion);
    else
        configuracion = ConfiguracionControlAutomatico;
        configuracion = restaurar(configuracion, archivo);
        %se mantiene la seleccion de reproduccion para esta configuracion.
        %Si por otro lado la seleccion es manual o autom => se fuerza autom
        if get(handles.rdReproduccion, 'Value') == get(handles.rdReproduccion, 'Max')
            radioToEnable = handles.rdReproduccion;
        else
            radioToEnable = handles.rdAutomaticoMatlab;
        end
        showConfiguracionAutomaticaControl(handles);
        establecerConfiguracionAutomatica(handles, configuracion);
    end
    
    set(radioToEnable, 'Value', get(radioToEnable, 'Max'));
    toogleRadioButton(radioToEnable, handles);
end

function modelo = getModelo(handles)
    modelo = 'UnTanque';
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


function establecerConfiguracionAutomatica(handles, configuracion)
    set(handles.txtSetPoint, 'String', num2str(getSetPoint(configuracion)));
    set(handles.txtBias, 'String', num2str(getBias(configuracion)));
    set(handles.txtKp, 'String', num2str(getKp(configuracion)));
    set(handles.txtKi, 'String', num2str(getKi(configuracion)));
    set(handles.txtKd, 'String', num2str(getKd(configuracion)));
end

function configuracion = recolectarConfiguracionManual(handles)
    valorActuador = str2num(get(handles.txtManual, 'String'));
	if isempty(valorActuador)
		error('SeleccionDeModelo:parametros','El porcentaje de control manual ingresado no es valido. Por favor ingrese un valor numerico');
    else
        configuracion = ConfiguracionControlManual(valorActuador);
    end
end


function establecerConfiguracionManual(handles, configuracion)
    set(handles.txtManual, 'String', num2str(getSalidaManual(configuracion)));
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



% --------------------------------------------------------------------
function GuardarConfigDeControl_Callback(hObject, eventdata, handles)
% hObject    handle to GuardarConfigDeControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global directorioInicio;
[filename, filepath] = uiputfile({'*.mat'}, 'Seleccionar archivo de Configuracion...', strcat(directorioInicio, '/Configuraciones/configuracion.mat'));
if filename
    [tipoSetDeControl, configuracion] = getTipoSetDeControlYConfiguracion(handles);
    configuracion = guardar(configuracion, strcat(filepath, filename));
    save(strcat(filepath, filename), '-append', 'tipoSetDeControl');
end

% --- Executes on button press in btnAbrirConfiguracion.
function btnAbrirConfiguracion_Callback(hObject, eventdata, handles)
% hObject    handle to btnAbrirConfiguracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global directorioInicio;
[filename, filepath] = uigetfile({'*.mat'}, 'Seleccionar archivo de configuracion de control...', strcat(directorioInicio, '/Configuraciones/configuracion.mat'));
if filename
    data = load(strcat(filepath, filename));
    setTipoSetDeControlYConfiguracionDeGrabacion(handles, strcat(filepath, filename), data.tipoSetDeControl);
end


% --- Executes on button press in btnAbrirGrabacion.
function btnAbrirGrabacion_Callback(hObject, eventdata, handles)
% hObject    handle to btnAbrirGrabacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ejecutarAbrirGrabacion(handles);

function ejecutarAbrirGrabacion(handles)
global directorioInicio;
[filename, filepath] = uigetfile({'*.mat'}, 'Seleccionar archivo de grabacion de control...', strcat(directorioInicio, '/Grabaciones/'));
if filename
    archivo = strcat(filepath, filename);
    w = getWindow('SeleccionDeModelo');
    try
        controlador = cargarProceso(w.controlador, archivo);
    catch
        exception = lasterr;
        msgboxException('Se ha detectado un error al abrir el archivo.', 'Error de archivo', exception);
    end
   setWindow('SeleccionDeModelo', w);
end


% --- Executes on button press in btnControlarPlanta.
function btnControlarPlanta_Callback(hObject, eventdata, handles)
% hObject    handle to btnControlarPlanta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
restablecerVisibilidadControlesPlanta(handles, get(handles.btnControlarPlanta, 'Value'));


% Hint: get(hObject,'Value') returns toggle state of btnControlarPlanta
function restablecerVisibilidadControlesPlanta(handles, mostrar)
heightWithoutFrames = 12;
diferenciaNuevaViejaAltura = (handles.originalHeight - heightWithoutFrames);
if mostrar
   showTipoSetDeControl(handles);
   restablecerVisibilidadConfiguracionControl(handles);
   pos = get(handles.wSeleccionDeModelo, 'Position');
   pos(2) = pos(2) - diferenciaNuevaViejaAltura;
   pos(4) = handles.originalHeight;
   set(handles.wSeleccionDeModelo, 'Position', pos);
   cambiarPosicionBotonesPrincipales(handles, 27);
else
   hideConfiguracionManualControl(handles);
   hideConfiguracionAutomaticaControl(handles);
   hideTipoSetDeControl(handles);
   pos = get(handles.wSeleccionDeModelo, 'Position');
   pos(2) = pos(2) + diferenciaNuevaViejaAltura;
   pos(4) = heightWithoutFrames;
   set(handles.wSeleccionDeModelo, 'Position', pos);
   cambiarPosicionBotonesPrincipales(handles, 3);
end

function cambiarPosicionBotonesPrincipales(handles, nuevoY)
   pos = get(handles.btnControlarPlanta, 'Position');
   pos(2) = nuevoY;
   set(handles.btnControlarPlanta, 'Position', pos);
   pos = get(handles.btnAbrirGrabacion, 'Position');
   pos(2) = nuevoY;
   set(handles.btnAbrirGrabacion, 'Position', pos);
end


function restablecerVisibilidadConfiguracionControl(handles)
	if get(handles.rdManual, 'Value') == get(handles.rdManual, 'Max')
        showConfiguracionManualControl(handles);
    else
        showConfiguracionAutomaticaControl(handles);
	end
end


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


% --------------------------------------------------------------------
function AcercaDe_Callback(hObject, eventdata, handles)
% hObject    handle to AcercaDe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AyudaGUI;


