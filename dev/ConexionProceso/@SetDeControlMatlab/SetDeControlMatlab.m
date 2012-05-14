function [ self ] = SetDeControlMatlab( modeloSimulink, configuracion)
global setDeControl;
    fprintf('Iniciando Set de Control Matlab\n');
	timerFunction = sprintf('fprintf(''Simulation Started\\n'');load_system(''%s'');', modeloSimulink);
    timerFunction = strcat(timerFunction, 'global setDeControl;  setDeControl = aplicarParametrosConfiguracion(setDeControl);');
    timerFunction = strcat(timerFunction, sprintf('set_param(''%s'', ''SimulationCommand'', ''start'');', modeloSimulink));
	self.modeloSimulink = modeloSimulink;
    self.configuracion = configuracion;
	self.timer = timer('Name', 'timerSetDeControlMatlab_startSimulink', 'BusyMode', 'drop', 'StartDelay',0, 'TimerFcn', timerFunction);
    self = class(self, 'SetDeControlMatlab');
    setDeControl = self;
end

