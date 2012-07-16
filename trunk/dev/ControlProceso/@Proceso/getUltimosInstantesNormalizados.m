function [ instantes ] = getUltimosInstantesNormalizados( self, cant)

global testbedContexto;
    
    instantes = getPeriodo(testbedContexto.configuracionAvanzada)*getUltimosInstantes(self, cant)/1000;