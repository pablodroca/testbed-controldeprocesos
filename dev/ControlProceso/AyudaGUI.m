function varargout = AyudaGUI(varargin)
% AYUDAGUI M-file for AyudaGUI.fig
%      AYUDAGUI, by itself, creates a new AYUDAGUI or raises the existing
%      singleton*.
%
%      H = AYUDAGUI returns the handle to a new AYUDAGUI or the handle to
%      the existing singleton*.
%
%      AYUDAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AYUDAGUI.M with the given input arguments.
%
%      AYUDAGUI('Property','Value',...) creates a new AYUDAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AyudaGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AyudaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AyudaGUI

% Last Modified by GUIDE v2.5 18-Jun-2012 01:05:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AyudaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AyudaGUI_OutputFcn, ...
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


% --- Executes just before AyudaGUI is made visible.
function AyudaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AyudaGUI (see VARARGIN)

% Choose default command line output for AyudaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AyudaGUI wait for user response (see UIRESUME)
% uiwait(handles.wAyuda);


% --- Outputs from this function are returned to the command line.
function varargout = AyudaGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCerrar.
function btnCerrar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
delete(handles.wAyuda);


