%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath(fullfile(pwd, 'ConexionProceso'));
addpath(fullfile(pwd, 'ControlProceso'));
addpath(fullfile(pwd, 'GraficoProceso'));
addpath(fullfile(pwd, 'SimulinkModels'));

%c = ControladorSeleccionDeModelo;

global conexion
global setDeControl

global ControladorVisorDelProcesoSelf
global muestraTimer
global muestras
muestraTimer = 0;
muestras = [];
SeleccionDeModeloGUI
return;
