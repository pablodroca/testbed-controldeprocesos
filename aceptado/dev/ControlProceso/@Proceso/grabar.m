function self = grabar( self, archivo )
    self.archivo = archivo;
	self.modoGrabacion = true;
	self.instanteInicioGrabacion = self.instanteUltimaMuestra;
end

