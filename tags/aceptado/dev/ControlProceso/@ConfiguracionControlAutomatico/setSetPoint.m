function [ self, setDeControl] = setSetPoint( self, setPoint, setDeControl )
    validarSetPoint(self, setPoint);
    self.setPoint = setPoint;
    setDeControl = modificar(setDeControl, 'SetPoint', 'Value', self.setPoint);
end
