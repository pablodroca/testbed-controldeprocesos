%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath(fullfile(pwd, 'ConexionProceso'));
addpath(fullfile(pwd, 'ControlProceso'));
addpath(fullfile(pwd, 'GraficoProceso'));
addpath(fullfile(pwd, 'SimulinkModels'));
addpath(fullfile(pwd, 'Utils'));

global directorioInicio;
global configuracionAvanzada;
global conexion;
global setDeControl;
global windowHandles;
global graficoProcesoZoom;

directorioInicio=pwd;
configuracionAvanzada = ConfiguracionAvanzada;
configuracionAvanzada = leer(configuracionAvanzada);
windowHandles = [];
graficoProcesoZoom = 1;

SeleccionDeModeloGUI

