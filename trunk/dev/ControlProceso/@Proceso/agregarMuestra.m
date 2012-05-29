function self = agregarMuestra(self, muestra)
	self.muestras = [self.muestras; muestra];
	self.instanteUltimaMuestra = 1 + self.instanteUltimaMuestra;

end