function self = comenzarGrabacion( self, archivo)
	self.proceso = grabar(self.proceso, archivo);
    mostrarCuadroComentario(self.vista);
end

