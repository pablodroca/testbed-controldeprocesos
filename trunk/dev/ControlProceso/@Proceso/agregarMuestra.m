function self = agregarMuestra(self, nivel, actuador, referencia)
	self.muestras = [self.muestras; [nivel actuador referencia]];
	self.instanteUltimaMuestra = 1 + self.instanteUltimaMuestra;
  
    fprintf('Muestra obtenida: %f. Actuador: %f. Ref: %f\n', nivel, actuador, referencia);
end