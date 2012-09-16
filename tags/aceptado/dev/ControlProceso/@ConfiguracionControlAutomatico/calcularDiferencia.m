function [ diferencia ] = calcularDiferencia( self, aComparar )
if self.setPoint ~= aComparar.setPoint
    diferencia = struct('propiedad', 'SetPoint', 'valor', aComparar.setPoint);
elseif self.bias ~= aComparar.bias
    diferencia = struct('propiedad', 'Bias', 'valor', aComparar.bias);
elseif self.kp ~= aComparar.kp
    diferencia = struct('propiedad', 'Kp', 'valor', aComparar.kp);
elseif self.ki ~= aComparar.ki
    diferencia = struct('propiedad', 'Ki', 'valor', aComparar.ki);
elseif self.kd ~= aComparar.kd
    diferencia = struct('propiedad', 'Kd', 'valor', aComparar.kd);
else
    diferencia = {};
end