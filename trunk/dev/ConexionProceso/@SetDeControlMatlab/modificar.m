function self = modificar( self, parametro, valor )
	fprintf('Modificando modelo ''%s''. %s=%f\n', self.modeloSimulink, parametro, valor); 
	set_param(strcat(self.modeloSimulink, '/', parametro),'Gain', num2str(valor));
end

