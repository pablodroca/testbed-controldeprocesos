function [ comentario ] = getComentarioPorInstante( self, instante )
 for ii=1:length(self.comentarios)
   c = self.comentarios{ii};
   if c.instante == instante
       comentario = c;
       return;
   end
end
comentario = {};