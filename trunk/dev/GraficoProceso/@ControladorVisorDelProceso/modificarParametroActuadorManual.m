function [ self, valido ] = modificarParametroActuadorManual( self, valor )

[self, valido] = modificarParametro(self, 'ValorManual', 'Value', valor);
