function registrarCambioConfiguracion( visorDelProceso, configuracionStruct )
    global testbedContexto
    handles = guihandles(visorDelProceso);
    
    configuracionActual = getConfiguracion(testbedContexto.setDeControl);
    configuracionModificada = configuracionActual; %clonamos la config para tener un objeto del tipo correcto
    configuracionModificada = importarStruct(configuracionModificada, configuracionStruct);
    diferencia = calcularDiferencia(configuracionActual, configuracionModificada);
    if ~isempty(diferencia)
        w = getWindow('VisorDelProceso');
        controlador = w.controlador;
        switch diferencia.propiedad
            case 'SetPoint'
                [controlador, valido] = modificarParametroSetPoint(controlador, diferencia.valor);
                if valido, set(handles.txtSetPoint, 'String', num2str(diferencia.valor)), end;
            case 'Bias'
                [controlador, valido] = modificarParametroBias(controlador, diferencia.valor);
                if valido, set(handles.txtBias, 'String', num2str(diferencia.valor)), end;
            case 'Kp'
                [controlador, valido] = modificarParametroKp(controlador, diferencia.valor);
                if valido, set(handles.txtKp, 'String', num2str(diferencia.valor)), end;
            case 'Ki'
                [controlador, valido] = modificarParametroKi(controlador, diferencia.valor);
                if valido, set(handles.txtKi, 'String', num2str(diferencia.valor)), end;
            case 'Kd'
                [controlador, valido] = modificarParametroKd(controlador, diferencia.valor);
                if valido, set(handles.txtKd, 'String', num2str(diferencia.valor)), end;
            case 'SalidaManual'
                [controlador, valido] = modificarParametroActuadorManual(controlador, diferencia.valor);
                if valido, set(handles.txtManual, 'String', num2str(diferencia.valor)), end;
        end
        w.controlador = controlador; 
        setWindow('VisorDelProceso', w);
    end
    
end