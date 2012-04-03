function self = crearYConectar(self)
    fprintf('ConexionDummy: Conectado\n');
    self.conectado = 1;
	start(self.timer);
end

