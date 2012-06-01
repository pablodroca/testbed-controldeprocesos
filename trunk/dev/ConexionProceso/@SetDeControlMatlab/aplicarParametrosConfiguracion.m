function [ self ] = aplicarParametrosConfiguracion( self )
fprintf('Aplicando parametros Config...\n');
[config, self] = aplicarParametros(self.configuracion, self);
self.configuracion = config;
end