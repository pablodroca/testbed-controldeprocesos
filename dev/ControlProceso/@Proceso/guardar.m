function self = guardar( self )
    fprintf('Proceso: Guardando en archivo %s\n', self.archivo);
	if self.modoGrabacion
		muestras = self.muestras(self.instanteInicioGrabacion:end);
		save self.archivo muestras;
		self.modoGrabacion = false;
		self.instanteInicioGrabacion = 0;
	end
end

