function self = procesarMuestra( self )
	global conexion;
	
	[conexion, muestra] = obtenerMuestra(conexion);
	fprintf('Muestra a procesar: %f.\n', muestra);
    instanteAnterior = getInstanteUltimaMuestra(self.proceso);
    if instanteAnterior == 0
        instanteAnterior = 1;
        muestraAnterior = muestra;
    else
        muestraAnterior = getUltimaMuestra(self.proceso);
    end
	self.proceso = agregarMuestra(self.proceso, muestra);
    instante = getInstanteUltimaMuestra(self.proceso);
	agregarMuestra(self.vista, [instanteAnterior;instante], [muestraAnterior; muestra]);
