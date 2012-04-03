function self = desconectar( self )
	stop(self.timer);
	delete(self.timer);
    fprintf('ConexionDummy: Desconectado\n');
end

