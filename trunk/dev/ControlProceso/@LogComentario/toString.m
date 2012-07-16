function [ string ] = toString( self )
global testbedContexto;
    tiempo = self.instante * getPeriodo(testbedContexto.configuracionAvanzada) / 1000;
    string = sprintf('%d (%.1f ms) - %s', self.numero, tiempo, self.texto); 