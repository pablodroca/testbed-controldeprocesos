function self = finalizarGrabacion( self )
	logDebug(sprintf('Guardando proceso...\n'));
	self.proceso = guardar(self.proceso);
    ocultarCuadroComentario(self.vista);
end

