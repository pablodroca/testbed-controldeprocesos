function self = procesarMuestra( self )
	global conexion;
	
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
%    fprintf('Agregando muestra a vista.\n');
 
    if ishandle(self.vista)       
        agregarMuestra(self.vista, [instanteAnterior;instante], [muestraAnterior; muestraConActuacion]);
        if existsWindow('GraficoDelProceso')
 %           fprintf('Agregando muestra al Grafico del Proceso.\n');
            w = getWindow('GraficoDelProceso');
            if ishandle(w.vista)   
                agregarMuestraGrafico(w.vista, [instanteAnterior; instante], [muestraAnterior; muestraConActuacion]);
            end
        end
    else
        fprintf('Vista destino inexistente. Deteniendo timer de procesar Muestra...');
    end
    
