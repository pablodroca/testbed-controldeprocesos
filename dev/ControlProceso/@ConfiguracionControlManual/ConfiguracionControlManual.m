function [ self ] = ConfiguracionControlManual( salidaManual )
   if nargin == 0
       salidaManual = 0;
   end
   self.salidaManual = salidaManual;
   self = class(self, 'ConfiguracionControlManual');
   validarSalidaManual(self, salidaManual);
end

