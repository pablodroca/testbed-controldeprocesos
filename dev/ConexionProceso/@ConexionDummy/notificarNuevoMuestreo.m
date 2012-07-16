function [ self ] = notificarNuevoMuestreo( self )
if self.indiceUltimaMuestraDummy < size(self.muestrasDummy, 1)
    logDebug('ConexionDummy: Incrementando paso de muestreo\n');
    self.indiceUltimaMuestraDummy = 1 + self.indiceUltimaMuestraDummy;
end