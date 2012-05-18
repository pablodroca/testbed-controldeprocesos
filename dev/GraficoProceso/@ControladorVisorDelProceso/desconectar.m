function self = desconectar( self )

global conexion
global setDeControl

	stop(self.timer);
	delete(self.timer);
	setDeControl = cerrar(setDeControl);
	conexion = desconectar(conexion);
	self.proceso = cerrar(self.proceso);
end

