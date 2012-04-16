function self = procesarMuestra( self )
	global conexion;
	
	[conexion, muestra] = obtenerMuestra(conexion);
	fprintf('Muestra a procesar: %f\n', muestra);
	self.proceso = agregarMuestra(self.proceso, muestra);
	agregarMuestra(self.vista, self.instanteUltimaMuestra, muestra);
