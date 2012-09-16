function self = agregarComentario( self , textoComentario)
	[self.proceso, comentario] = agregarComentario(self.proceso, textoComentario);
    w = getWindow('VisorDelProceso');
    agregarComentario(w.vista, comentario);
end

