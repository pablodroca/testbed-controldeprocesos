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

% Last Modified by GUIDE v2.5 01-May-2012 12:44:07

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



function edit_DirectorioDefecto_Callback(hObject, eventdata, handles)
% hObject    handle to edit_DirectorioDefecto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_DirectorioDefecto as text
%        str2double(get(hObject,'String')) returns contents of edit_DirectorioDefecto as a double


% --- Executes during object creation, after setting all properties.
function edit_ControlActiveX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ControlActiveX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_ControlActiveX_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ControlActiveX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ControlActiveX as text
%        str2double(get(hObject,'String')) returns contents of edit_ControlActiveX as a double


% --- Executes during object creation, after setting all properties.
function edit_Comando_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Comando (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function edit_Comando_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Comando (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Comando as text
%        str2double(get(hObject,'String')) returns contents of edit_Comando as a double

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
  validado = validarConfiguracion(handles);
  if (validado)
    % TODO CORREGIR PARA GUARDAR: configuracionAvanzada.guardar();    
    close(handles.output);
  end

% --- Executes on button press in pushbutton_Cancelar.
function pushbutton_Cancelar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Cancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  close(handles.output);


% --- Application specific methods

function validado = validarConfiguracion(handles)
  validado = false;
  
  directorioDefecto = stringTrim(get(handles.edit_DirectorioDefecto,'String'));
  if (length(directorioDefecto)>0) && not(exist(directorioDefecto,'dir'))
    msgbox('El directorio especificado no existe','Error en Configuracion','error');
    return
  end
  
  controlActiveX = stringTrim(get(handles.edit_ControlActiveX,'String'));
  if (length(controlActiveX)==0)
    msgBox('El control activeX no esta especificado','error')
    return
  end
  
  velocidad = stringTrim(get(handles.edit_Velocidad,'String'));
  if not(isNumber(velocidad))
    msgbox('El valor para la velocidad debe ser numerico, entero y positivo','error');
    return
  end
  
  puerto = stringTrim(get(handles.edit_Puerto,'String'));
  if not(isNumber(puerto))
    msgbox('El valor para el puerto debe ser numerico, entero y positivo','error');
    return
  end
  
  comando = stringTrim(get(handles.edit_Comando,'String'));
  if not(isNumber(comando))
    msgbox('El valor para el comando debe ser numerico, entero y positivo', 'error');
    return
  end
  
  periodo = stringTrim(get(handles.edit_Periodo,'String'));
  if not(isNumber(periodo))
    msgbox('El periodo debe ser numerico, entero y positivo', 'error');
    return
  end
  
  ejeTemporal = stringTrim(get(handles.edit_EjeTemporal,'String'));
  if not(isNumber(ejeTemporal))
    msgbox('La ventana temporal debe ser numerico, entero y positivo', 'error');
    return
  end
    
  nivelMinimo = stringTrim(get(handles.edit_NivelMinimo,'String'));
  if not(isNumber(nivelMinimo))
    msgbox('El valor del nivel minimo debe ser numerico, entero y positivo', 'error');
    return
  end

  nivelMaximo = stringTrim(get(handles.edit_NivelMaximo,'String'));
  if not(isNumber(nivelMaximo))
    msgbox('El valor del nivel maximo debe ser numerico, entero y positivo', 'error');
    return
  end

  validado = true;
  return  
  
function stringTrimmed = stringTrim(string)
  stringTrimmed = deblank(strjust(string,'left')); 
   
function number = isNumber(strNum)
  number = false;
  num = str2num(strNum);
  [f c] = size(num);
  if not(f==1 && c==1)
    return
  end
  if (num<=0)
    return
  end
  [f c] = size(strfind(strNum,'.'));
  if not(f==0 && c==0)
    return
  end
  number = true
  return
