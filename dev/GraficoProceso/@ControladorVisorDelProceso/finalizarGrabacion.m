function self = finalizarGrabacion( self )
	fprintf('Guardando proceso...\n');
	self.proceso = guardar(self.proceso);
end

