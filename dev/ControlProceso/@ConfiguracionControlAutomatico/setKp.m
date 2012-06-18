function [ self, setDeControl ] = setKp( self, kp, setDeControl )
    validarKp(self, kp);
    self.kp = kp;
    setDeControl = modificar(setDeControl, 'Kp', 'Gain', self.kp);
end