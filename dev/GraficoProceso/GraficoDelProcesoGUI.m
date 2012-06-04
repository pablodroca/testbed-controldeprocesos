function varargout = GraficoDelProcesoGUI(varargin)
% GRAFICODELPROCESOGUI M-file for GraficoDelProcesoGUI.fig
%      GRAFICODELPROCESOGUI, by itself, creates a new GRAFICODELPROCESOGUI or raises the existing
%      singleton*.
%
%      H = GRAFICODELPROCESOGUI returns the handle to a new GRAFICODELPROCESOGUI or the handle to
%      the existing singleton*.
%
%      GRAFICODELPROCESOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICODELPROCESOGUI.M with the given input arguments.
%
%      GRAFICODELPROCESOGUI('Property','Value',...) creates a new GRAFICODELPROCESOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GraficoDelProcesoGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GraficoDelProcesoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GraficoDelProcesoGUI

% Last Modified by GUIDE v2.5 02-Jun-2012 16:12:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GraficoDelProcesoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GraficoDelProcesoGUI_OutputFcn, ...
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


% --- Executes just before GraficoDelProcesoGUI is made visible.
function GraficoDelProcesoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GraficoDelProcesoGUI (see VARARGIN)

% Choose default command line output for GraficoDelProcesoGUI
handles.output = hObject;

w = getWindow('VisorDelProceso');
proceso = getProceso(w.controlador);
%ESTE HABRIA QUE ELIMINARLO SI EL ANTERIOR FUNCIONA
%proceso = varargin{1};

w.vista = handles.wGraficoDelProceso;
w.controlador = ControladorGraficoDelProceso(handles.wGraficoDelProceso);
setWindow('GraficoDelProceso', w);

instantes = 1:getInstanteUltimaMuestra(proceso);
muestras = getTodasMuestras(proceso);

set(get(handles.axesGraficoDelProceso,'Title'), 'String', 'Grafico del Proceso Ampliado');
set(get(handles.axesGraficoDelProceso,'XLabel'), 'String', 'Tiempo [min.]');
set(get(handles.axesGraficoDelProceso,'YLabel'), 'String', 'Nivel [cm.]');

line(instantes, muestras','Parent', handles.axesGraficoDelProceso);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GraficoDelProcesoGUI wait for user response (see UIRESUME)
% uiwait(handles.wGraficoDelProceso);


% --- Outputs from this function are returned to the command line.
function varargout = GraficoDelProcesoGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on mouse press over axes background.
function axesGraficoDelProceso_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axesVisorProceso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in toggleZoom.
function toggleZoom_Callback(hObject, eventdata, handles)
% hObject    handle to toggleZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleZoom
if get(hObject,'Value')
    zoom(handles.wGraficoDelProceso,'on');
else
    zoom(handles.wGraficoDelProceso,'out');
end

% --- Executes on button press in toggleGHorizontal.
function toggleGHorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to toggleGHorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleGHorizontal
if get(hObject,'Value')
    set(handles.axesGraficoDelProceso,'XGrid','on');
else
    set(handles.axesGraficoDelProceso,'XGrid','off');
end

% --- Executes on button press in toggleGVertical.
function toggleGVertical_Callback(hObject, eventdata, handles)
% hObject    handle to toggleGVertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleGVertical
if get(hObject,'Value')
    set(handles.axesGraficoDelProceso,'YGrid','on');
else
    set(handles.axesGraficoDelProceso,'YGrid','off');
end


