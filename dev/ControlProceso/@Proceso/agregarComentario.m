function [ self, comentario ] = agregarComentario( self, textoComentario )
    instante = getUltimosInstantes(self, 1);
    muestraActual = self.muestras(instante, :);
    valoresActuales = normalizarMuestras(self, muestraActual);
    numero = size(self.comentarios);
    comentario = LogComentario(numero, textoComentario, instante, valoresActuales(1));
    self.comentarios = [self.comentarios; comentario];
end