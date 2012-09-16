function self = cerrar( self )
    if self.modoGrabacion
		self = guardar(self);
	end
end

