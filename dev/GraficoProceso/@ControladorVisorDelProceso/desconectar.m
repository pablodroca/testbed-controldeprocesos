function self = desconectar( self )

global conexion
global setDeControl

	stop(self.timer);
	
	current_state = 'on';
	while ~strcmp(current_state, 'off')
		pause(0.05);
		current_state = get(self.timer, 'Running');
	end
	delete(self.timer);
	setDeControl = cerrar(setDeControl);
	conexion = desconectar(conexion);
	self.proceso = cerrar(self.proceso);
	delete(self.vista);
end

