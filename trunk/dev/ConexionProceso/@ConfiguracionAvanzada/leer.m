function self = leer( self )
  global directorioInicio;
  
  file = strcat(directorioInicio,'/configuracionAvanzada.mat');
  if exist(file, 'file')
    fileSelf = load(file);
  
    self.velocidad = fileSelf.self.velocidad;
    self.puerto = fileSelf.self.puerto;
    %self.comando = fileSelf.comando;
    %self.periodo = fileSelf.periodo;
    %self.ejetemporal = fileSelf.ejetemporal;
    %self.periodo = fileSelf.periodo;
    %self.nivelMinimo = fileSelf.nivelMinimo;
    %sself.nivelMaximo = fileSelf.nivelMaximo;
    end
end

