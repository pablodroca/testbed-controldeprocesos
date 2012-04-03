function [ self ] = ControladorVisorDelProceso(wVisorDelProceso)
	timerFunction = 'fprintf(''Procesando Muestras...\n''); ControladorVisorDelProcesoSelf = procesarMuestra(ControladorVisorDelProcesoSelf);';

	self.vista = wVisorDelProceso;
	self.timer = timer('Period',0.1, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
	self.instanteUltimaMuestra = 0;
	self = class(self, 'ControladorVisorDelProceso');
	global ControladorVisorDelProcesoSelf
	ControladorVisorDelProcesoSelf = self;

	start(self.timer);
end

