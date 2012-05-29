function self = ConfiguracionAvanzada()
   self.velocidad=57600;
   self.puerto=3;
   self.periodo=3;
   self.ejeTemporal=15;
   self.periodo=3;
   self.nivelMinimo=10;
   self.nivelMaximo=50;
   self.nivelVisorOffset = 0;
   self.nivelVisorEscala = 1.25;
   self.actuacionManualMinima = 0;
   self.actuacionManualMaxima = 50;
   self.actuacionVisorOffset = 60;
   self.actuacionVisorEscala = 1.8;
   self = class(self, 'ConfiguracionAvanzada');
end
