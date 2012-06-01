function [ self, setDeControl ] = setKp( self, kd, setDeControl )

self.kd = kd;
setDeControl = modificar(setDeControl, 'Kd', 'Gain', self.kd);