function [ instantes ] = getInstantesNormalizados( self )
    global configuracionAvanzada;
    
    instantes = getInstantes(self);
    instantes = getPeriodo(configuracionAvanzada)*instantes/1000;
