function [ muestrasNormalizadas ] = getUltimasMuestras( self, cant)
    instantes = getUltimosInstantes(self, cant);
    instantes = instantes';
    if self.instanteUltimaMuestra > 0
        muestras = self.muestras(instantes, :);
    else
        muestras = [];
    end
    
    muestrasNormalizadas = normalizarMuestras(self, muestras);