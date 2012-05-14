function [ self ] = aplicarParametrosConfiguracion( self )
fprintf('Aplicnado parametros Config...\n');
[config, self] = aplicarParametros(self.configuracion, self);
self.configuracion = config;
end