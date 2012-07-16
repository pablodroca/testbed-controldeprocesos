function self = crearYConectar(self)
    logDebug(sprintf('ConexionDummy: Conectado\n'));
    self.conectado = 1;
	start(self.timer);
end

