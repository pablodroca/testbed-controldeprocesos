function [ self ] = aplicarParametrosConfiguracion( self )
logDebug(sprintf('Aplicando parametros Config...\n'));
[config, self] = aplicarParametros(self.configuracion, self);
self.configuracion = config;


global testbedContexto;
config = testbedContexto.configuracionAvanzada;
self = modificar(self, 'CNivelDesplazamiento', 'Value', -getNivelVisorOffset(config));
self = modificar(self, 'CNivelEscala', 'Gain', getNivelVisorEscala(config));
self = modificar(self, 'CActEscalaManual', 'Value', 1/getActuacionVisorEscala(config));
self = modificar(self, 'CActEscalaBias', 'Gain', 1/getActuacionVisorEscala(config));
self = modificar(self, 'CActDesplazamiento', 'Value', -getActuacionVisorOffset(config));
self = modificar(self, 'CActEscalaVisor', 'Gain', getActuacionVisorEscala(config));
end