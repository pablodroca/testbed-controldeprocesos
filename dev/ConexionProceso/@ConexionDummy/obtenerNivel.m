function [self, nivel] = obtenerNivel( self )
    %transcurrido = etime(clock, self.clockUltimaMuestra);
    %while transcurrido*1000 < self.msEntreMuestras
    %fprintf('ConexionDummy: iterando....\n');
    %    pause(0.15 * self.msEntreMuestras/1000);
    %    transcurrido = etime(clock, self.clockUltimaMuestra);
    %end
    %self.clockUltimaMuestra = clock;
    nivel = self.muestrasDummy(self.indiceUltimaMuestraDummy);
    fprintf('ConexionDummy: Nivel Obtenido: %f.\n', nivel);
end

