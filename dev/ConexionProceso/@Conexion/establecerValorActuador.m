function self = establecerValorActuador( self, valor )
% establecerValorActuador Envia el valor indicado al actuador de la conexion.
    self.valorActuador = valor;
    AnalogicOutput(self.placa, self.canalActuador, valor);
end