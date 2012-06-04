function [ muestrasNormalizadas ] = getTodasMuestras( self )
  muestrasNormalizadas = normalizarMuestras( self, self.muestras);