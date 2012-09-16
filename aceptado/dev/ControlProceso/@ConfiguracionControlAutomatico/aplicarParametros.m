function [ self, setDeControl] = aplicarParametros( self, setDeControl )
setDeControl = modificar(setDeControl, 'SwitchManual', 'sw', '0');
setDeControl = modificar(setDeControl, 'SetPoint', 'Value', self.setPoint);
setDeControl = modificar(setDeControl, 'Bias', 'Value', self.bias);
setDeControl = modificar(setDeControl, 'Kp', 'Gain', self.kp);
setDeControl = modificar(setDeControl, 'Ki', 'Gain', self.ki);
setDeControl = modificar(setDeControl, 'Kd', 'Gain', self.kd);