function self = guardar( self )
    fprintf('Proceso: Guardando muestras [%d %d] en archivo %s\n', self.instanteInicioGrabacion, self.instanteUltimaMuestra, self.archivo);
	if self.modoGrabacion
		muestras = self.muestras(self.instanteInicioGrabacion:end, :);
        leyendaMuestras = self.leyendaMuestras;
		comentarios = {};
        cambiosConfiguracion = {};
        tipo = self.tipo;
        for ii=1:length(self.comentarios)
            c = self.comentarios{ii};
            if getInstante(c) >= self.instanteInicioGrabacion
                instanteCorregido = getInstante(c) - self.instanteInicioGrabacion + 1;
                comentarios{length(comentarios)+1} = struct('numero', getNumero(c), 'texto', getTexto(c), 'instante', instanteCorregido, 'valor', getValor(c));
            end
        end
        for ii=1:length(self.cambiosConfiguracion)
            c = self.cambiosConfiguracion{ii};
            if c.instante >= self.instanteInicioGrabacion
                instanteCorregido = c.instante - self.instanteInicioGrabacion + 1;
                config = exportarStruct(c.configuracion);
                cambiosConfiguracion{length(cambiosConfiguracion)+1} = struct('instante', instanteCorregido, 'configuracion', config);
            end
        end
        configuracion = exportarStruct(self.configuracionInicial);
		save(self.archivo, 'muestras', 'leyendaMuestras', 'comentarios', 'configuracion', 'cambiosConfiguracion', 'tipo');
		self.modoGrabacion = false;
		self.instanteInicioGrabacion = 0;
	end
end

