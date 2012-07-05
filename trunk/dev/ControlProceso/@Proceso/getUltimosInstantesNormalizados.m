function [ instantes ] = getUltimosInstantesNormalizados( self, cant)

    global configuracionAvanzada;
    
    instantes = getPeriodo(configuracionAvanzada)*getUltimosInstantes(self, cant)/1000;