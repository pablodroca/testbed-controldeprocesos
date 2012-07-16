function [ muestrasNormalizadas ] = normalizarMuestras( self, muestras )
global testbedContexto;
    referenciaVisorOffset = 0;
    referenciaVisorEscala = 1;
    config = testbedContexto.configuracionAvanzada;
    muestrasNormalizadas = muestras - repmat([getNivelVisorOffset(config) getActuacionVisorOffset(config) referenciaVisorOffset], size(muestras, 1), 1);
    muestrasNormalizadas = muestrasNormalizadas * diag([1/getNivelVisorEscala(config) 1/getActuacionVisorEscala(config) 1/referenciaVisorEscala]);
    