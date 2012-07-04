function self = establecerUltimaMuestraDummy( self )
	logDebug(sprintf('ConexionDummy: estableciendo ultima muestra dummy. Indice actual: %d\n', self.indiceUltimaMuestraDummy));
    if (isempty(self.clockUltimaMuestraDummy) || (etime(clock, self.clockUltimaMuestraDummy) >= (self.segundosEntreMuestras-self.segundosErrorAcumulado))) && self.indiceUltimaMuestraDummy < size(self.muestrasDummy, 1)
		self.indiceUltimaMuestraDummy = 1 + self.indiceUltimaMuestraDummy;
        nuevoClock = clock;
        diferenciaClock = self.segundosEntreMuestras;
        if ~isempty(self.clockUltimaMuestraDummy)
            diferenciaClock = etime(nuevoClock, self.clockUltimaMuestraDummy);
        end
        self.segundosErrorAcumulado =  diferenciaClock - (self.segundosEntreMuestras-self.segundosErrorAcumulado);
        self.clockUltimaMuestraDummy = nuevoClock;
	end
end

