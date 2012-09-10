function self = leer( self, archivo)
   data = load(archivo);
   if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios')) ...
           || ~find(strcmp(fieldnames(data), 'leyendaMuestras')) || ~find(strcmp(fieldnames(data), 'configuracion')) || ~find(strcmp(fieldnames(data), 'cambiosConfiguracion'))
        error('Proceso:leer', 'El archivo indicado no posee las variables "muestras", "comentarios", "configuracion", "cambiosConfiguracion" y "leyendaMuestras", requeridos para el proceso.');
   end
   self.muestras = data.muestras;
   self.leyendaMuestras = data.leyendaMuestras;
   self.comentarios = {};
   for ii=1:length(data.comentarios)
      c = data.comentarios{ii};
      self.comentarios{ii} = LogComentario(c.numero, c.texto, c.instante, c.valor);    
   end
   
   
   if strcmp(data.tipo, 'Manual')
       self.configuracionInicial = ConfiguracionControlManual;
   else %if strcmp(data.tipo,'AutomaticoMatlab')
       self.configuracionInicial = ConfiguracionControlAutomatico;
   end
   self.configuracionInicial = importarStruct(self.configuracionInicial, data.configuracion);
   
   
   self.cambiosConfiguracion = {};
   for ii=1:length(data.cambiosConfiguracion)
       c = data.cambiosConfiguracion{ii};
       config = self.configuracionInicial;
       config = importarStruct(config, c.configuracion);
       self.cambiosConfiguracion{ii} = struct('instante',c.instante, 'configuracion',config);
       %tipo = getTipo(c.configuracion);
       %if strcmp(tipo, 'Manual')
       %    self.configuracionInicial = ConfiguracionControlManual;
       %elseif strcmp(tipo, 'AutomaticoMatlab')
      %     self.configuracionInicial = ConfiguracionControlAutomatico;
      % end
     % self.cambiosConfiguracion{ii} = importarStruct(self.configuracionInicial, c.configuracion);
   end
   self.instanteUltimaMuestra = size(self.muestras, 1);
   self.instanteInicioGrabacion = 0;
   self.archivo = '';
   self.modoGrabacion = false;
end
