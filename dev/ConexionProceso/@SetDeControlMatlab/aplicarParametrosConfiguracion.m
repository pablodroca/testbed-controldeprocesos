function [ self ] = aplicarParametrosConfiguracion( self )
logDebug(sprintf('Aplicando parametros Config...\n'));
[config, self] = aplicarParametros(self.configuracion, self);
self.configuracion = config;
end