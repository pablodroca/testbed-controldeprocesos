function [ self, setDeControl] = setBias( self, bias, setDeControl)
    validarBias(self, bias);
    self.bias = bias;
    setDeControl = modificar(setDeControl, 'Bias', 'Value', self.bias);
end