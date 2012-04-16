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

% Last Modified by GUIDE v2.5 30-Mar-2012 00:43:57

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
handles.output = hObject;
handles.controlador = ControladorSeleccionDeModelo(handles.wSeleccionDeModelo);

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


% --- Executes on button press in rd2Tanques.
function rd2Tanques_Callback(hObject, eventdata, handles)
% hObject    handle to rd2Tanques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rd2Tanques


% --- Executes on button press in rd1Tanque.
function rd1Tanque_Callback(hObject, eventdata, handles)
% hObject    handle to rd1Tanque (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rd1Tanque


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


% --- Executes on button press in rdAutomaticoABB.
function rdAutomaticoABB_Callback(hObject, eventdata, handles)
% hObject    handle to rdAutomaticoABB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdAutomaticoABB


% --- Executes on button press in rdAutomaticoMatlab.
function rdAutomaticoMatlab_Callback(hObject, eventdata, handles)
% hObject    handle to rdAutomaticoMatlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rdAutomaticoMatlab


% --- Executes on button press in btnConectar.
function btnConectar_Callback(hObject, eventdata, handles)
% hObject    handle to btnConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.controlador = conectar(handles.controlador, 'UnTanque');


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
