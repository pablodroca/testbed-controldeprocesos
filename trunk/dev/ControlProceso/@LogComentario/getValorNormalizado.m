function [ valorNormalizado] = getValorNormalizado( self )

    global configuracionAvanzada;
    valorNormalizado = self.valor; %normalizarValorNivel(configuracionAvanzada, self.valor);
