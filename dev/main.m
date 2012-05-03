%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath(fullfile(pwd, 'ConexionProceso'));
addpath(fullfile(pwd, 'ControlProceso'));
addpath(fullfile(pwd, 'GraficoProceso'));
addpath(fullfile(pwd, 'SimulinkModels'));
addpath(fullfile(pwd, 'Utils'));

global directorioInicio;
directorioInicio=pwd;

global configuracionAvanzada;
configuracionAvanzada = ConfiguracionAvanzada;

%TODO: falla la invocacion al metodo, ???
%configuracionAvanzada.guardar(configuracionAvanzada);
%configuracionAvanzada.leer();

global figura

global conexion
global setDeControl
global windowHandles

%global muestraTimer
%global muestras

windowHandles = [];
muestraTimer = 0;
muestras = [];
SeleccionDeModeloGUI

