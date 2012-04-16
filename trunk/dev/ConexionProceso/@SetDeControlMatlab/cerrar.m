function self = cerrar( self )
    fprintf('Deteniendo simulacion: %s\n', self.modeloSimulink);
	set_param(self.modeloSimulink, 'SimulationCommand', 'stop');
	delete(self.timer);
end

