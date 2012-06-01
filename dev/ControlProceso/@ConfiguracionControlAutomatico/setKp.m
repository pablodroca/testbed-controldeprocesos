function [ self, setDeControl ] = setKp( self, kp, setDeControl )

self.kp = kp;
setDeControl = modificar(setDeControl, 'Kp', 'Gain', self.kp);