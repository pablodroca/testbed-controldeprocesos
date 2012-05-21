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
    fprintf('Agregando muestra a vista.\n');
 
    if ishandle(self.vista)       
        agregarMuestra(self.vista, [instanteAnterior;instante], [muestraAnterior; muestra]);
        if existsWindow('GraficoDelProceso')
          try
            agregarMuestraGrafico(getWindow('GraficoDelProceso'), [instanteAnterior; instante], [muestraAnterior; muestra]);
          catch
            %error = lasterror;
            %error('Error al intentar agregar muestra a GraficoDelProceso: ' + error.message);
            disp('Error al intentar agregar muestra a GraficoDelProceso');
          end
        end
    else
        fprintf('Vista destino inexistente. Deteniendo timer de procesar Muestra...');
    end
    
