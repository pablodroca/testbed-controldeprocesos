function [ self, setDeControl] = setSetPoint( self, setPoint, setDeControl )

self.setPoint = setPoint;
setDeControl = modificar(setDeControl, 'SetPoint', 'Value', self.setPoint);