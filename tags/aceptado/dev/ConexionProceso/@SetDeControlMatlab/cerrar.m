function self = cerrar( self )
    logDebug(sprintf('Deteniendo simulacion: %s\n', self.modeloSimulink));
	set_param(self.modeloSimulink, 'SimulationCommand', 'stop');
	delete(self.timer);
end

