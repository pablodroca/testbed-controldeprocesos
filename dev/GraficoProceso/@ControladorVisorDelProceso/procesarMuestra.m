function self = procesarMuestra( self )
	global conexion;
    global configuracionAvanzada;
	
    [conexion, muestra] = obtenerMuestra(conexion);
    [conexion, actuador] = obtenerValorActuador(conexion);
    fprintf('Muestra obtenida: %f. Actuador: %f\n', muestra, actuador);
    muestraConActuacion = [muestra, actuador];
    instanteAnterior = getInstanteUltimaMuestra(self.proceso);
    if instanteAnterior == 0
        instanteAnterior = 1;
        muestraAnterior = muestraConActuacion;
    else
        muestraAnterior = getUltimaMuestra(self.proceso);
    end
    self.proceso = agregarMuestra(self.proceso, muestraConActuacion);
    instante = getInstanteUltimaMuestra(self.proceso);
 
    config = configuracionAvanzada;
    muestrasEscaladas = [muestraAnterior; muestraConActuacion] - repmat([getNivelVisorOffset(config) getActuacionVisorOffset(config)], 2, 1);
    muestrasEscaladas = muestrasEscaladas * diag([1/getNivelVisorEscala(config) 1/getActuacionVisorEscala(config)]);
    if ishandle(self.vista)       
        agregarMuestra(self.vista, [instanteAnterior;instante], muestrasEscaladas);
    end
    if existsWindow('GraficoDelProceso')
        w = getWindow('GraficoDelProceso');
        if ishandle(w.vista)   
            %agregarMuestraGrafico(w.vista, [instanteAnterior; instante], muestrasEscaladas);
        end
    else
        fprintf('Vista destino inexistente. Deteniendo timer de procesar Muestra...');
    end
    
