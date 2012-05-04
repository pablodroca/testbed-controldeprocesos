function self = guardar( self )
  global directorioInicio;
  save(strcat(directorioInicio,'/configuracionAvanzada.mat'), 'self');
end