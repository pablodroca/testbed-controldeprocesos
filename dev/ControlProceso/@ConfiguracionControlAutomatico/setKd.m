function [ self, setDeControl ] = setKp( self, kd, setDeControl )
    validarKd(self, kd);
    self.kd = kd;
    setDeControl = modificar(setDeControl, 'Kd', 'Gain', self.kd);
end