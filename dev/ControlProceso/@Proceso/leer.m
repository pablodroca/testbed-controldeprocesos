function self = leer( self, archivo)
   data = importdata(archivo);
   if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios'))
        error('Proceso:leer', 'El archivo indicado no posee las variables "muestras" y "comentarios", requeridos para el proceso.');
   end
   self.muestras = data.muestras;
   self.comentarios = {};
   for ii=1:length(data.comentarios)
      c = data.comentarios{ii};
      self.comentarios{ii} = LogComentario(c.numero, c.texto, c.instante, c.valor);    
   end
   self.instanteUltimaMuestra = size(self.muestras, 1);
   self.instanteInicioGrabacion = 0;
   self.archivo = '';
   self.modoGrabacion = false;
end

