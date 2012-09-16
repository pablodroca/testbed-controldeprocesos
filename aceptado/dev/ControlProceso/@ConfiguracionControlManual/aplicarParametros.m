function [ self, setDeControl] = aplicarParametros( self, setDeControl )
setDeControl = modificar(setDeControl, 'SwitchManual', 'sw', '1');
setDeControl = modificar(setDeControl, 'ValorManual', 'Gain', self.salidaManual);
