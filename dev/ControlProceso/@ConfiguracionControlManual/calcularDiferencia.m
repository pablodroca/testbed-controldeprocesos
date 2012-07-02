function [ diferencia ] = calcularDiferencia( self, aComparar )

if self.salidaManual ~= aComparar.salidaManual
    diferencia = struct('propiedad', 'SalidaManual', 'valor', aComparar.salidaManual);
else
    diferencia = {};
end