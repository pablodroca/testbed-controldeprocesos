function [ self] = iniciar( self )
	timerFunction = 'w = getWindow(''VisorDelProceso''); logDebug(sprintf(''Procesando Muestras...\n'')); if isempty(w.controlador), return,end;';
    timerFunction = strcat(timerFunction, 'w.controlador = procesarMuestra(w.controlador);');
    timerFunction = strcat(timerFunction, 'setWindow(''VisorDelProceso'', w);');
	if strcmp(self.tipoSetDeControl, 'Reproduccion')
        timerFunction = strcat(timerFunction, 'notificarEventosGrabacion(w.controlador);');
    end
	
global testbedContexto;
    periodoSegundos = getPeriodo(testbedContexto.configuracionAvanzada)/1000;
    self.timer = timer('Name', 'timerControladorVisor_ProcesarMuestra', 'StartDelay', 1, 'BusyMode', 'drop', 'Period', periodoSegundos, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
	start(self.timer);
end
