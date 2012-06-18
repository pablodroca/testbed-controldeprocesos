function self = guardar( self )
    fprintf('Proceso: Guardando muestras [%d %d] en archivo %s\n', self.instanteInicioGrabacion, self.instanteUltimaMuestra, self.archivo);
	if self.modoGrabacion
		muestras = self.muestras(self.instanteInicioGrabacion:end, :);
		save(self.archivo, 'muestras');
		self.modoGrabacion = false;
		self.instanteInicioGrabacion = 0;
	end
end

