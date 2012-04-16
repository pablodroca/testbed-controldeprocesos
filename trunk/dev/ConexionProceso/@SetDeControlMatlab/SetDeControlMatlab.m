function [ self ] = SetDeControlMatlab( modeloSimulink )
	timerFunction = sprintf('fprintf(''Simulation Started\\n'');load_system(''%s'');set_param(''%s'', ''SimulationCommand'', ''start'');', modeloSimulink, modeloSimulink);
	self.modeloSimulink = modeloSimulink;
	self.timer = timer('Name', 'timerSetDeControlMatlab_startSimulink', 'BusyMode', 'drop', 'StartDelay',0, 'TimerFcn', timerFunction);
	self = class(self, 'SetDeControlMatlab');
	start(self.timer);
end

