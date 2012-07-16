function [ valorNivelNormalizado ] = normalizarValorNivel( self, valorNivel )
   global testbedContexto;
    config = testbedContexto.configuracionAvanzada;
    valorNivelNormalizado = valorNivel - getNivelVisorOffset(config);
    valorNivelNormalizado = valorNivelNormalizado * diag(1/getNivelVisorEscala(config));
        