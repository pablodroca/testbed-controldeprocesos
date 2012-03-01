%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath('ConexionProceso');
addpath('ControlProceso');
addpath('GraficoProceso');
addpath('SimulinkModels');


SAMPLES_QTY = 200;

global conexion
%load_system('.\SimulinkModels\UnTanque.mdl');
    
muestras = [];
modoDummy = 2;
if modoDummy == 0
    conexion = ConexionDummy(3);
    conexion = crearYConectar(conexion);
    conexion = establecerUltimaMuestraDummy(conexion, 10);


    set_param('UnTanque', 'SimulationCommand', 'start');
    for i = 1:SAMPLES_QTY
        pause(0.3);
        muestra = 10 + i;
        conexion = establecerUltimaMuestraDummy(conexion, muestra);
        muestras = [muestras muestra];
    end
    set_param('UnTanque', 'SimulationCommand', 'stop');
    desconectar(conexion);
elseif modoDummy == 1
    conexion = Conexion(3);
    conexion = crearYConectar(conexion);
    set_param('UnTanque', 'SimulationCommand', 'start');
    for i = 1:SAMPLES_QTY
        pause(0.3);
        [conexion, muestra] = obtenerMuestra(conexion);
        fprintf('Muestra obtenida: %f', muestra);
        muestras = [muestras muestra];
    end
    set_param('UnTanque', 'SimulationCommand', 'stop');
    desconectar(conexion);
else
    tic
    conexion = Conexion(3);
    conexion = crearYConectar(conexion);
    
        [conexion] = establecerValorActuador(conexion, 65);
        
    for i = 1:SAMPLES_QTY
        pause(0.2);
        [conexion, muestra] = obtenerMuestra(conexion);
        fprintf('%d Muestra obtenida: %f\n', i, muestra);
        muestras = [muestras muestra];
    end
    
        [conexion] = establecerValorActuador(conexion, 85);
        
    for i = 1:SAMPLES_QTY
        pause(0.2);
        [conexion, muestra] = obtenerMuestra(conexion);
        fprintf('%d Muestra obtenida: %f\n', i, muestra);
        muestras = [muestras muestra];
    end
    
        [conexion] = establecerValorActuador(conexion, 100);
        
    for i = 1:SAMPLES_QTY
        pause(0.2);
        [conexion, muestra] = obtenerMuestra(conexion);
        fprintf('%d Muestra obtenida: %f\n', i, muestra);
        muestras = [muestras muestra];
    end
    
        [conexion] = establecerValorActuador(conexion, 45);
        
    desconectar(conexion);
    toc
end
