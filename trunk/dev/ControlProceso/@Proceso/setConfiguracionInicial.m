function [ self ] = setConfiguracionInicial( self, configuracion )
self.configuracionInicial = configuracion;
self.leyendaMuestras = getLeyendaMuestras(configuracion);
   