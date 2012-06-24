function [ self, comentario ] = agregarComentario( self, textoComentario )
    instante = getUltimosInstantes(self, 1);
    muestraActual = self.muestras(instante, :);
    valoresActuales = normalizarMuestras(self, muestraActual);
    numero = length(self.comentarios) + 1;
    comentario = LogComentario(numero, textoComentario, instante, valoresActuales(1));
    self.comentarios{length(self.comentarios) + 1}= comentario;
end