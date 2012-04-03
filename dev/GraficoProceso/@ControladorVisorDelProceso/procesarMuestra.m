function self = procesarMuestra( self )
	global conexion;
	[conexion, muestra] = obtenerMuestra(conexion);
	self.instanteUltimaMuestra = 1 + self.instanteUltimaMuestra;
	fprintf('Muestra a procesar: %f\n', muestra);
	agregarMuestra(self.vista, self.instanteUltimaMuestra, muestra);
