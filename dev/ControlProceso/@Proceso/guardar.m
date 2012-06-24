function self = guardar( self )
    fprintf('Proceso: Guardando muestras [%d %d] en archivo %s\n', self.instanteInicioGrabacion, self.instanteUltimaMuestra, self.archivo);
	if self.modoGrabacion
		muestras = self.muestras(self.instanteInicioGrabacion:end, :);
		comentarios = {};
        for ii=1:length(self.comentarios)
            c = self.comentarios{ii};
            comentarios{ii} = struct('numero', getNumero(c), 'texto', getTexto(c), 'instante', getInstante(c), 'valor', getValor(c));
        end
		save(self.archivo, 'muestras', 'comentarios');
		self.modoGrabacion = false;
		self.instanteInicioGrabacion = 0;
	end
end

