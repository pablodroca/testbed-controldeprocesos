function [ self, setDeControl] = aplicarParametros( self, setDeControl )
setDeControl = modificar(setDeControl, 'SalidaManual', self.salidaManual);
