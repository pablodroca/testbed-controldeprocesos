function [self, muestra] = obtenerMuestra( self )
    transcurrido = etime(clock, self.clockUltimaMuestra);
    while transcurrido*1000 < self.msEntreMuestras
        pause(0.33 * self.msEntreMuestras/1000);
        transcurrido = etime(clock, self.clockUltimaMuestra);
    end
    self.clockUltimaMuestra = clock;
  %  fprintf('Conexion: Muestra Obtenida: %f\n', self.valorDummy);
    muestra = self.muestrasDummy(self.indiceUltimaMuestraDummy);
    fprintf('ConexionDummy: Muestra Obtenida: %f.\n', muestra);
end

