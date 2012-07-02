function [ self] = iniciar( self )
	timerFunction = 'w = getWindow(''VisorDelProceso''); fprintf(''Procesando Muestras...\n''); if isempty(w.controlador), return,end;';
    timerFunction = strcat(timerFunction, 'w.controlador = procesarMuestra(w.controlador);');
    if strcmp(self.tipoSetDeControl, 'Reproduccion')
        timerFunction = strcat(timerFunction, 'w.controlador = notificarEventosGrabacion(w.controlador);');
    end
	timerFunction = strcat(timerFunction, 'setWindow(''VisorDelProceso'', w); fprintf(''Fin Procesando Muestras...\n'');');
	
    global configuracionAvanzada;
    periodoSegundos = getPeriodo(configuracionAvanzada)/1000;
    self.timer = timer('Name', 'timerControladorVisor_ProcesarMuestra', 'StartDelay', 1, 'BusyMode', 'drop', 'Period', periodoSegundos, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
	start(self.timer);
end
