function self = establecerUltimaMuestraDummy( self )
	fprintf('ConexionDummy: estableciendo ultima muestra dummy. Indice actual: %d\n', self.indiceUltimaMuestraDummy);
    if (self.indiceUltimaMuestraDummy >= size(self.muestrasDummy, 2))
		self.indiceUltimaMuestraDummy = 1;
	else
		self.indiceUltimaMuestraDummy = 1 + self.indiceUltimaMuestraDummy;
	end
end

