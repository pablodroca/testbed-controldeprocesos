function [ instante ] = getInstanteNormalizado( self )
global testbedContexto;
    
    instante = getPeriodo(testbedContexto.configuracionAvanzada)*self.instante/1000;