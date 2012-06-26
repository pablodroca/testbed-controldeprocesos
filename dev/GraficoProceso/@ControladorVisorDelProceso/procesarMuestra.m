function self = procesarMuestra( self )
	global conexion;
    global configuracionAvanzada;
    global setDeControl;
    config = getConfiguracion(setDeControl);
	
    [conexion, nivel] = obtenerNivel(conexion);
    [conexion, actuador] = obtenerValorActuador(conexion);
    [referencia] = getValorReferencia(config);
    self.proceso = agregarMuestra(self.proceso, nivel, actuador, referencia);
    ultimosInstantes = getUltimosInstantes(self.proceso, 2);
    ultimasMuestras = getUltimasMuestrasNormalizadas(self.proceso, 2);
    leyendaMuestras = getLeyendaMuestras(self.proceso);
    
    if ishandle(self.vista)       
        agregarMuestra(self.vista, ultimosInstantes, ultimasMuestras, leyendaMuestras);
    end
    if existsWindow('GraficoDelProceso')
        w = getWindow('GraficoDelProceso');
        if ishandle(w.vista)   
            agregarMuestraGrafico(w.vista, ultimosInstantes, ultimasMuestras);
        end
    else
        fprintf('Vista destino inexistente. Deteniendo timer de procesar Muestra...');
    end
    
