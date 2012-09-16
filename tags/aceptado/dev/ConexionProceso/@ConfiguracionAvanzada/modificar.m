function self = modificar( self, velocidad, puerto, periodo, ejeTemporal, nivelMinimo, nivelMaximo, nivelOffset, nivelEscala, actuacionOffset, actuacionEscala)
%MODIFICAR Summary of this function goes here
%  Detailed explanation goes here
    self.velocidad = velocidad;
    self.puerto = puerto;
    self.periodo = periodo;
    self.ejeTemporal = ejeTemporal;
    self.nivelMinimo = nivelMinimo;
    self.nivelMaximo = nivelMaximo;
    
   self.nivelVisorOffset = nivelOffset;
   self.nivelVisorEscala = nivelEscala;
   self.actuacionVisorOffset = actuacionOffset;
   self.actuacionVisorEscala = actuacionEscala;
