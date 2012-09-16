function [ self, setDeControl] = setSalidaManual( self, salidaManual, setDeControl)
    validarSalidaManual(self, salidaManual);
    self.salidaManual = salidaManual;
    setDeControl = modificar(setDeControl, 'ValorManual', 'Gain', self.salidaManual);
end