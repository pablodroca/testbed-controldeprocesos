function self = desconectar( self )
	stop(self.timer);
	delete(self.timer);
    logDebug(sprintf('ConexionDummy: Desconectado\n'));
end

