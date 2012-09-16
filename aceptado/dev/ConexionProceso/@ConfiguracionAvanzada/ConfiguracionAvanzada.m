function self = ConfiguracionAvanzada()
   self.velocidad=57600;
   self.puerto=3;
   self.ejeTemporal=120;
   self.periodo=500;
   self.nivelMinimo=0;
   self.nivelMaximo=100;
   self.nivelVisorOffset = -16.32;
   self.nivelVisorEscala = 0.606;
   self.actuacionManualMinima = 0;
   self.actuacionManualMaxima = 50;
   self.actuacionVisorOffset = -50;
   self.actuacionVisorEscala = 0.5;
   self = class(self, 'ConfiguracionAvanzada');
end
