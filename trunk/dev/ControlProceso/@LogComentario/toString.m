function [ string ] = toString( self )
    global configuracionAvanzada;
    tiempo = self.instante * getPeriodo(configuracionAvanzada) / 1000;
    string = sprintf('%d (%.1f ms) - %s', self.numero, tiempo, self.texto); 