function self = guardar( self )
global testbedContexto;
  save(strcat(testbedContexto.directorioInicio,'/configuracionAvanzada.mat'), 'self');
end