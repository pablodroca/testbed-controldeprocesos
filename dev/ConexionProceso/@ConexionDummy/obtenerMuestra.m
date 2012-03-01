function [self, muestra] = obtenerMuestra( self )
    transcurrido = toc(self.ticUltimaMuestra);
    while transcurrido*1000 < self.msEntreMuestras
        pause(0.5 * self.msEntreMuestras/1000);
        transcurrido = toc(self.ticUltimaMuestra);
    end
    self.ticUltimaMuestra = tic;
  %  fprintf('Conexion: Muestra Obtenida: %f\n', self.valorDummy);
    muestra = self.ultimaMuestraDummy;
    fprintf('ConexionDummy: Muestra Obtenida: %f.\n', muestra);
end

