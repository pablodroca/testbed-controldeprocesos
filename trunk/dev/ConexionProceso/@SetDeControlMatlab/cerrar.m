function self = cerrar( self )
    fprintf('Simulation Stoped\n');
	set_param(self.modeloSimulink, 'SimulationCommand', 'stop'); 
	delete(self.timer);
end

