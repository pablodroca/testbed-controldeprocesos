function [ self ] = ConfiguracionAvanzada( )
   %self = struct();
   self.directorioDefecto='';
   self.controlActiveX='RiacQXControl.RiacQX';
   self.velocidad=57600;
   self.puerto=3;
   self.comando=1;
   self.periodo=3;
   self.ejetemporal=15;
   self.periodo=3;
   self.nivelMinimo=10;
   self.nivelMaximo=50;
   self = class(self, 'ConfiguracionAvanzada');
end
