function conectar( self )

   
global conexion
load_system('UnTanque.mdl');
    
muestras = [];
    conexion = ConexionDummy(3);
    conexion = crearYConectar(conexion);
    conexion = establecerUltimaMuestraDummy(conexion, 10);
    
    muestraTimer = 0;
    timer1 = timer('StartDelay',0, 'TimerFcn', ...
        'fprintf(''Simulation Started\n'');set_param(''UnTanque'', ''SimulationCommand'', ''start'');');
    timer2 = timer('StartDelay',10, 'TimerFcn', ...
        'fprintf(''Simulation Stoped\n''); set_param(''UnTanque'', ''SimulationCommand'', ''stop''); conexion = desconectar(conexion); delete(timer1);delete(timer2);delete(timer3);');
    start(timer1); start(timer2);
    
   VisorDelProcesoGUI('wSeleccionDeModelo', 'dummy')
    
    %wait(timer1); wait(timer2); stop(timer3);
    %delete(timer1); delete(timer2); delete(timer3);

    
end

