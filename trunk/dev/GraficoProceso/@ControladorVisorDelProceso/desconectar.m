function desconectar( self )

global conexion
global setDeControl

	stop(self.timer);
	setDeControl = cerrar(setDeControl);
	conexion = desconectar(conexion);
	delete(self.vista);
end

