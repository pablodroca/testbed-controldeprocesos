function self = modificar( self, parametro, propiedad, valor )
	logDebug(sprintf('Modificando modelo ''%s''. %s->%s=%f\n', self.modeloSimulink, parametro, propiedad, valor)); 
	set_param(strcat(self.modeloSimulink, '/', parametro),propiedad, num2str(valor));
end

