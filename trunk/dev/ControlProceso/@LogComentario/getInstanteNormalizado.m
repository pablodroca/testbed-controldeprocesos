function [ instante ] = getInstanteNormalizado( self )
    global configuracionAvanzada;
    
    instante = getPeriodo(configuracionAvanzada)*self.instante/1000;