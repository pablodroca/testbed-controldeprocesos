function [ self, valido ] = modificarParametroKp( self, valor )

[self, valido] = modificarParametro(self, 'Kp', 'Gain', valor);