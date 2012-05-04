function self = leer( self )
  global directorioInicio;
  
  file = strcat(directorioInicio,'/configuracionAvanzada.mat');
  if exist(file, 'file')
    fileSelf = load(file);
  
    self.velocidad = fileSelf.self.velocidad;
    self.puerto = fileSelf.self.puerto;
    self.periodo = fileSelf.periodo;
    self.ejeTemporal = fileSelf.ejeTemporal;
    self.nivelMinimo = fileSelf.nivelMinimo;
    self.nivelMaximo = fileSelf.nivelMaximo;
    end
end

