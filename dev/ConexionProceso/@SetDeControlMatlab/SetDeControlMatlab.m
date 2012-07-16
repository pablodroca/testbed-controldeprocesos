function [ self ] = SetDeControlMatlab( modeloSimulink, configuracion)
global testbedContexto;
    logDebug(sprintf('Iniciando Set de Control Matlab\n'));
	timerFunction = sprintf('logDebug(sprintf(''Simulation Started\\n''));load_system(''%s'');', modeloSimulink);
    timerFunction = strcat(timerFunction, 'global testbedContexto;  testbedContexto.setDeControl = aplicarParametrosConfiguracion(testbedContexto.setDeControl);');
    timerFunction = strcat(timerFunction, sprintf('set_param(''%s'', ''SimulationCommand'', ''start'');', modeloSimulink));
	self.modeloSimulink = modeloSimulink;
    self.configuracion = configuracion;
	self.timer = timer('Name', 'timerSetDeControlMatlab_startSimulink', 'BusyMode', 'drop', 'StartDelay',0, 'TimerFcn', timerFunction);
    self = class(self, 'SetDeControlMatlab');
    testbedContexto.setDeControl = self;
end

