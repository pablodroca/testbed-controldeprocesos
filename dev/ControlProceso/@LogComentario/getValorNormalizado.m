function [ valorNormalizado] = getValorNormalizado( self )

global testbedContexto;
    valorNormalizado = normalizarValorNivel(testbedContexto.configuracionAvanzada, self.valor);
