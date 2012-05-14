function [ self] = iniciar( self )
	timerFunction = 'w = getWindow(''VisorDelProceso''); fprintf(''Procesando Muestras...\n''); if isempty(w.controlador), return,end;  w.controlador = procesarMuestra(w.controlador); setWindow(''VisorDelProceso'', w); fprintf(''Fin Procesando Muestras...\n'');';
	self.timer = timer('Name', 'timerControladorVisor_ProcesarMuestra', 'StartDelay', 1, 'BusyMode', 'drop', 'Period',0.2, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
	start(self.timer);
end
