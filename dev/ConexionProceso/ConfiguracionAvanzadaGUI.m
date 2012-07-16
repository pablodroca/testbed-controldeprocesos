function varargout = ConfiguracionAvanzadaGUI(varargin)
% CONFIGURACIONAVANZADAGUI M-file for ConfiguracionAvanzadaGUI.fig
%      CONFIGURACIONAVANZADAGUI, by itself, creates a new CONFIGURACIONAVANZADAGUI or raises the existing
%      singleton*.
%
%      H = CONFIGURACIONAVANZADAGUI returns the handle to a new CONFIGURACIONAVANZADAGUI or the handle to
%      the existing singleton*.
%
%      CONFIGURACIONAVANZADAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFIGURACIONAVANZADAGUI.M with the given input arguments.
%
%      CONFIGURACIONAVANZADAGUI('Property','Value',...) creates a new CONFIGURACIONAVANZADAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ConfiguracionAvanzadaGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ConfiguracionAvanzadaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ConfiguracionAvanzadaGUI

% Last Modified by GUIDE v2.5 05-Jul-2012 01:15:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ConfiguracionAvanzadaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ConfiguracionAvanzadaGUI_OutputFcn, ...
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


% --- Executes just before ConfiguracionAvanzadaGUI is made visible.
function ConfiguracionAvanzadaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ConfiguracionAvanzadaGUI (see VARARGIN)

% Choose default command line output for ConfiguracionAvanzadaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global testbedContexto;
config = testbedContexto.configuracionAvanzada;
set(handles.edit_Velocidad, 'String', getVelocidad(config));
set(handles.edit_Puerto, 'String', getPuerto(config));
set(handles.edit_Periodo, 'String', getPeriodo(config));
set(handles.edit_EjeTemporal, 'String', getEjeTemporal(config));
set(handles.edit_NivelMinimo, 'String', getNivelMinimo(config));
set(handles.edit_NivelMaximo, 'String', getNivelMaximo(config));

set(handles.edit_NivelDesplazamiento, 'String', getNivelVisorOffset(config));
set(handles.edit_NivelEscala, 'String', getNivelVisorEscala(config));
set(handles.edit_ActuadorDesplazamiento, 'String', getActuacionVisorOffset(config));
set(handles.edit_ActuadorEscala, 'String', getActuacionVisorEscala(config));
% UIWAIT makes ConfiguracionAvanzadaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ConfiguracionAvanzadaGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit_DirectorioDefecto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_DirectorioDefecto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes during object creation, after setting all properties.
function edit_Periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_Periodo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Periodo as text
%        str2double(get(hObject,'String')) returns contents of edit_Periodo as a double


% --- Executes during object creation, after setting all properties.
function edit_EjeTemporal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_EjeTemporal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function edit_EjeTemporal_Callback(hObject, eventdata, handles)
% hObject    handle to edit_EjeTemporal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_EjeTemporal as text
%        str2double(get(hObject,'String')) returns contents of edit_EjeTemporal as a double

% --- Executes during object creation, after setting all properties.
function edit_NivelMinimo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_NivelMinimo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_NivelMinimo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_NivelMinimo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_NivelMinimo as text
%        str2double(get(hObject,'String')) returns contents of edit_NivelMinimo as a double


% --- Executes during object creation, after setting all properties.
function edit_NivelMaximo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_NivelMaximo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_NivelMaximo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_NivelMaximo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_NivelMaximo as text
%        str2double(get(hObject,'String')) returns contents of edit_NivelMaximo as a double


% --- Executes during object creation, after setting all properties.
function edit_Puerto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Puerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function edit_Puerto_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Puerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Puerto as text
%        str2double(get(hObject,'String')) returns contents of edit_Puerto as a double


% --- Executes during object creation, after setting all properties.
function edit_Velocidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Velocidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function edit_Velocidad_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Velocidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Velocidad as text
%        str2double(get(hObject,'String')) returns contents of edit_Velocidad as a double


% --- Executes on button press in pushbutton_Aceptar.
function pushbutton_Aceptar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Aceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global testbedContexto;
  validado = validarConfiguracion(handles);
  if (validado)
    testbedContexto.configuracionAvanzada = recolectarValores(testbedContexto.configuracionAvanzada, handles);
    testbedContexto.configuracionAvanzada = guardar(testbedContexto.configuracionAvanzada);
    close(handles.output);
  end

% --- Executes on button press in pushbutton_Cancelar.
function pushbutton_Cancelar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Cancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  close(handles.output);


% --- Application specific methods
function configuracionAvanzada = recolectarValores(configuracionAvanzada, handles)
  velocidad = str2num(get(handles.edit_Velocidad,'String'));
  puerto = str2num(get(handles.edit_Puerto,'String'));
  periodo = str2num(get(handles.edit_Periodo,'String'));
  ejeTemporal = str2num(get(handles.edit_EjeTemporal,'String'));
  nivelMinimo = str2num(get(handles.edit_NivelMinimo,'String'));
  nivelMaximo = str2num(get(handles.edit_NivelMaximo,'String'));
  

  nivelOffset = str2num(get(handles.edit_NivelDesplazamiento, 'String'));
  nivelEscala = str2num(get(handles.edit_NivelEscala, 'String'));
  actuadorOffset = str2num(get(handles.edit_ActuadorDesplazamiento, 'String'));
  actuadorEscala = str2num(get(handles.edit_ActuadorEscala, 'String'));
  configuracionAvanzada = modificar(configuracionAvanzada, velocidad, puerto, periodo, ejeTemporal, nivelMinimo, nivelMaximo, nivelOffset, nivelEscala, actuadorOffset, actuadorEscala);
end

function validado = validarConfiguracion(handles)
  validado = false;
  
  velocidad = stringtrim(get(handles.edit_Velocidad,'String'));
  if not(isinteger(velocidad))
    msgbox('El valor para la velocidad debe ser numerico, entero y positivo','error');
    return
  end
  
  puerto = stringtrim(get(handles.edit_Puerto,'String'));
  if not(isinteger(puerto))
    msgbox('El valor para el puerto debe ser numerico, entero y positivo','error');
    return
  end
 
  periodo = stringtrim(get(handles.edit_Periodo,'String'));
  if not(isnumber(periodo))
    msgbox('El periodo debe ser numerico y positivo', 'error');
    return
  end
  
  ejeTemporal = stringtrim(get(handles.edit_EjeTemporal,'String'));
  if not(isnumber(ejeTemporal))
    msgbox('La ventana temporal debe ser numerico y positivo', 'error');
    return
  end
    
  nivelMinimo = stringtrim(get(handles.edit_NivelMinimo,'String'));
  if not(isnumber(nivelMinimo))
    msgbox('El valor del nivel minimo debe ser numerico y positivo', 'error');
    return
  end

  nivelMaximo = stringtrim(get(handles.edit_NivelMaximo,'String'));
  if not(isnumber(nivelMaximo))
    msgbox('El valor del nivel maximo debe ser numerico y positivo', 'error');
    return
  end

  validado = true;
  return  
  


% --- Executes during object creation, after setting all properties.
function edit_NivelDesplazamiento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_NivelDesplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_NivelDesplazamiento_Callback(hObject, eventdata, handles)
% hObject    handle to edit_NivelDesplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_NivelDesplazamiento as text
%        str2double(get(hObject,'String')) returns contents of edit_NivelDesplazamiento as a double


% --- Executes during object creation, after setting all properties.
function edit_NivelEscala_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_NivelEscala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_NivelEscala_Callback(hObject, eventdata, handles)
% hObject    handle to edit_NivelEscala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_NivelEscala as text
%        str2double(get(hObject,'String')) returns contents of edit_NivelEscala as a double


% --- Executes during object creation, after setting all properties.
function edit_ActuadorDesplazamiento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ActuadorDesplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_ActuadorDesplazamiento_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ActuadorDesplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ActuadorDesplazamiento as text
%        str2double(get(hObject,'String')) returns contents of edit_ActuadorDesplazamiento as a double


% --- Executes during object creation, after setting all properties.
function edit_ActuadorEscala_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ActuadorEscala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_ActuadorEscala_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ActuadorEscala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ActuadorEscala as text
%        str2double(get(hObject,'String')) returns contents of edit_ActuadorEscala as a double


