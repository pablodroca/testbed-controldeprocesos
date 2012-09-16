function self = desconectar( self )

global testbedContexto

    if ~isempty(self.timer)
        stop(self.timer);
        delete(self.timer);
    end
	testbedContexto.setDeControl = cerrar(testbedContexto.setDeControl);
	testbedContexto.conexion = desconectar(testbedContexto.conexion);
    testbedContexto.setDeControl = [];
    testbedContexto.conexion = [];
	self.proceso = cerrar(self.proceso);
end

