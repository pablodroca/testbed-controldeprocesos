function [ muestra ] = getUltimaMuestra( self )
muestra = self.muestras(self.instanteUltimaMuestra,:);