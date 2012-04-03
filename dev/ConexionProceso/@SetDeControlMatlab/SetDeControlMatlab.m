function [ self ] = SetDeControlMatlab( modeloSimulink )
	timerFunction = sprintf('fprintf(''Simulation Started\n'');set_param(''%s'', ''SimulationCommand'', ''start'');', modeloSimulink);
	self = struct('modeloSimulink', modeloSimulink, 'timer', timer('StartDelay',0, 'TimerFcn', timerFunction));
	self = class(self, 'SetDeControlMatlab');
	start(self.timer);
end

