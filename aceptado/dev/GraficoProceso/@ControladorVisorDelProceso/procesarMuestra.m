function self = procesarMuestra( self )
global testbedContexto;
config = getConfiguracion(testbedContexto.setDeControl);

[testbedContexto.conexion, activo] = notificarNuevoMuestreo(testbedContexto.conexion);
if activo
    [nivel] = obtenerNivel(testbedContexto.conexion);
    [actuador] = obtenerValorActuador(testbedContexto.conexion);
    [referencia] = getValorReferencia(config);
    self.proceso = agregarMuestra(self.proceso, nivel, actuador, referencia);
    ultimosInstantes = getUltimosInstantesNormalizados(self.proceso, 2);
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
        logDebug(sprintf('Vista destino inexistente. Deteniendo timer de procesar Muestra...'));
    end
end
