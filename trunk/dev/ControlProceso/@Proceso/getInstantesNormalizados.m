function [ instantes ] = getInstantesNormalizados( self )
global testbedContexto;
    
    instantes = getInstantes(self);
    instantes = getPeriodo(testbedContexto.configuracionAvanzada)*instantes/1000;
