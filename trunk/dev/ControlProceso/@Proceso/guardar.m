function self = guardar( self )
    fprintf('Proceso: Guardando muestras [%d %d] en archivo %s\n', self.instanteInicioGrabacion, self.instanteUltimaMuestra, self.archivo);
	if self.modoGrabacion
		muestras = self.muestras(self.instanteInicioGrabacion:end, :);
		comentarios = {};
        for ii=1:length(self.comentarios)
            c = self.comentarios{ii};
            if getInstante(c) >= self.instanteInicioGrabacion
                instanteCorregido = getInstante(c) - self.instanteInicioGrabacion + 1;
                comentarios{length(comentarios)+1} = struct('numero', getNumero(c), 'texto', getTexto(c), 'instante', instanteCorregido, 'valor', getValor(c));
            end
        end
		save(self.archivo, 'muestras', 'comentarios');
		self.modoGrabacion = false;
		self.instanteInicioGrabacion = 0;
	end
end

