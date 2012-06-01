function [ self, setDeControl] = setKi( self, ki, setDeControl )

self.ki = ki;
setDeControl = modificar(setDeControl, 'Ki', 'Gain', self.ki);