function self = guardar( self )
  global directorioInicio;
  
fprintf('Grabando: %s\n', strcat(directorioInicio,'/configuracionAvanzada.mat'));
  save(strcat(directorioInicio,'/configuracionAvanzada.mat'), 'self');
  
  
  %directorioDefecto = self.directorioDefecto;
  %controlActiveX = self.controlActiveX;
  %velocidad = self.velocidad;
%   puerto = self.puerto;
%   comando = self.comando;
%   periodo = self.periodo;
%   ejetemporal = self.ejetemporal;
%   periodo = self.periodo;
%   nivelMinimo = self.nivelMinimo;
%   nivelMaximo = self.nivelMaximo;
%   
%   save(strcat(directorioInicio,'configuracionAvanzada'), 'directorioDefecto');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'controlActiveX');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'velocidad');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'puerto');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'comando');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'periodo');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'ejetemporal');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'periodo');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'nivelMinimo');
%   save(strcat(directorioInicio,'configuracionAvanzada'),'-APPEND', 'nivelMaximo');
end