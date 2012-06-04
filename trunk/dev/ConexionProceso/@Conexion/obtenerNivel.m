function [ self, nivel ] = obtenerMuestra( self )
%obtenerMuestra Obtiene una muestra de la placa para el canal de la
%conexion
    nivel = AnalogicInput(self.placa, self.canalSensor)/1298*3;
end
