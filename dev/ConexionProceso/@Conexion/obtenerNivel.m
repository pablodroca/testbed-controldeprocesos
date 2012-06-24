function [ self, nivel ] = obtenerMuestra( self )
%obtenerMuestra Obtiene una muestra de la placa para el canal de la
%conexion
    nivel = AnalogicInput(self.placa, self.canalSensor)/1298*3;
    if ~strcmp(self.placa.ErrNumber, 'NoError')
        error('Conexion:crearYConectar', sprintf('Ha ocurrido un error desconocido durante la adquisicion de datos de la placa RIAC. Codigo de error: (%s)', self.placa.ErrNumber));
    end
end
