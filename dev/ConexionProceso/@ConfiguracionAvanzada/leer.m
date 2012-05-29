function self = leer( self )
  global directorioInicio;
  
  file = strcat(directorioInicio,'/configuracionAvanzada.mat');
  if exist(file, 'file')
    fileSelf = load(file);
  
    self.velocidad = fileSelf.self.velocidad;
    self.puerto = fileSelf.self.puerto;
    self.periodo = fileSelf.self.periodo;
    self.ejeTemporal = fileSelf.self.ejeTemporal;
    self.nivelMinimo = fileSelf.self.nivelMinimo;
    self.nivelMaximo = fileSelf.self.nivelMaximo;
    self.nivelVisorEscala = fileSelf.self.nivelVisorEscala;
    self.actuacionManualMinima = fileSelf.self.actuacionManualMinima;
    self.actuacionManualMaxima = fileSelf.self.actuacionManualMaxima;
    self.actuacionVisorOffset = fileSelf.self.actuacionVisorOffset;
    self.actuacionVisorEscala = fileSelf.self.actuacionVisorEscala;
  end
end

