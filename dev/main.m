%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath(fullfile(pwd, 'ConexionProceso'));
addpath(fullfile(pwd, 'ControlProceso'));
addpath(fullfile(pwd, 'GraficoProceso'));
addpath(fullfile(pwd, 'SimulinkModels'));

%c = ControladorSeleccionDeModelo;


   global ControladorVisorDelProcesoSelf
global conexion
global muestraTimer
global muestras
muestraTimer = 0;
muestras = [];
SeleccionDeModeloGUI
return;

SAMPLES_QTY = 4;

global conexion
global muestraTimer
load_system('UnTanque.mdl');
    
muestras = [];
modoEjecucion = 0;

if modoEjecucion == 0
    conexion = ConexionDummy(3);
    conexion = crearYConectar(conexion);
    conexion = establecerUltimaMuestraDummy(conexion, 10);
    
    muestraTimer = 0;
    timer1 = timer('StartDelay',0, 'TimerFcn', ...
        'fprintf(''Simulation Started\n'');set_param(''UnTanque'', ''SimulationCommand'', ''start'');');
    timer2 = timer('StartDelay',10, 'TimerFcn', ...
        'fprintf(''Simulation Stoped\n''); set_param(''UnTanque'', ''SimulationCommand'', ''stop''); conexion = desconectar(conexion); delete(timer1);delete(timer2);delete(timer3);');
    timer3 = timer('Period',0.5, 'ExecutionMode','fixedDelay', 'TimerFcn', ...
        'fprintf(''%d'', muestraTimer); muestraTimer =  muestraTimer + 1; conexion = establecerUltimaMuestraDummy(conexion, muestraTimer); muestras = [muestras muestraTimer];');
    start(timer1); start(timer2); start(timer3);
    %wait(timer1); wait(timer2); stop(timer3);
    %delete(timer1); delete(timer2); delete(timer3);
elseif modoEjecucion == 1
    conexion = Conexion(3);
    conexion = crearYConectar(conexion);

    timer1 = timer('StartDelay',0, 'TimerFcn', ...
        'fprintf(''Simulation Started\n'');set_param(''UnTanque'', ''SimulationCommand'', ''start'');');
    timer2 = timer('StartDelay',10, 'TimerFcn', ...
        'fprintf(''Simulation Stoped\n''); set_param(''UnTanque'', ''SimulationCommand'', ''stop''); conexion = desconectar(conexion); delete(timer1);delete(timer2);delete(timer3);');
    timer3 = timer('Period',0.5, 'ExecutionMode','fixedDelay', 'TimerFcn', ...
        '[conexion, muestraTimer] = obtenerMuestra(conexion); fprintf(''Muestra obtenida: %f\n'', muestraTimer); muestras = [muestras muestraTimer];');
    start(timer1); start(timer2); start(timer3);
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
