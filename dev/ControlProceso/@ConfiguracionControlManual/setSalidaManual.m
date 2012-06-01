function [ self, setDeControl] = setSalidaManual( self, salidaManual, setDeControl)
self.salidaManual = salidaManual;
setDeControl = modificar(setDeControl, 'ValorManual', 'Gain', self.salidaManual);