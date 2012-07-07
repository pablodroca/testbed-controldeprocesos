function [ valorNivelNormalizado ] = normalizarValorNivel( self, valorNivel )
    global configuracionAvanzada;
    config = configuracionAvanzada;
    valorNivelNormalizado = valorNivel - getNivelVisorOffset(config);
    valorNivelNormalizado = valorNivelNormalizado * diag(1/getNivelVisorEscala(config));
        