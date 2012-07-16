%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath(fullfile(pwd, 'ConexionProceso'));
addpath(fullfile(pwd, 'ControlProceso'));
addpath(fullfile(pwd, 'GraficoProceso'));
addpath(fullfile(pwd, 'SimulinkModels'));
addpath(fullfile(pwd, 'Utils'));

global testbedContexto;
testbedContexto.directorioInicio = pwd;
testbedContexto.conexion = {};
testbedContexto.setDeControl = {};
testbedContexto.windowHandles = {};
testbedContexto.graficoProcesoZoom = 0;
testbedContexto.configuracionAvanzada = ConfiguracionAvanzada;
testbedContexto.configuracionAvanzada = leer(testbedContexto.configuracionAvanzada);


SeleccionDeModeloGUI

