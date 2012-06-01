function [ self, setDeControl] = setBias( self, bias, setDeControl)
self.bias = bias;
setDeControl = modificar(setDeControl, 'Bias', 'Value', self.bias);