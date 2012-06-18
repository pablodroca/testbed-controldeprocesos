function [ self, setDeControl] = setKi( self, ki, setDeControl )
    validarKi(self, ki);
    self.ki = ki;
    setDeControl = modificar(setDeControl, 'Ki', 'Gain', self.ki);
end