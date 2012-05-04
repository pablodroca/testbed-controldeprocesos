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
  end
end

