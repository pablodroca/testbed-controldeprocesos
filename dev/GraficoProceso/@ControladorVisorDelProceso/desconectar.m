function self = desconectar( self )

global conexion
global setDeControl

    if ~isempty(self.timer)
        stop(self.timer);
        delete(self.timer);
    end
	setDeControl = cerrar(setDeControl);
	conexion = desconectar(conexion);
    setDeControl = [];
    conexion = [];
	self.proceso = cerrar(self.proceso);
end

