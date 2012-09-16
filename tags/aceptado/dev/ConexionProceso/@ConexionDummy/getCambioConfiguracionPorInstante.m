function [ cambioConfiguracion ] = getCambioConfiguracionPorInstante( self, instante )
 for ii=1:length(self.cambiosConfiguracion)
   c = self.cambiosConfiguracion{ii};
   if c.instante == instante
       cambioConfiguracion = c.configuracion;
       return;
   end
end
cambioConfiguracion = {};