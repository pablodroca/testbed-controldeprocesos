function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
    valor = muestras(end, 1);
	set(handles.txtNivel, 'String', valor);
	set(handles.txtInstante, 'String', instantes(end, 1));
    rectangle('Position', [0 0 20 100], 'Curvature', [0.1 0.1], 'FaceColor', [1 1 1]*206/255, 'Parent', handles.axesBarraTanque);
    rectangle('Position', [0 0 20 valor], 'Curvature', [0.1 0.1], 'FaceColor', 'b', 'Parent', handles.axesBarraTanque);

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
    
    instanteActual = instantes(2);
    global configuracionAvanzada;
    periodo = getPeriodo(configuracionAvanzada);
    maxValueX = getEjeTemporal(configuracionAvanzada) * (1000/periodo);
    if instanteActual > maxValueX
        xlim(handles.axesVisorProceso, [instanteActual-maxValueX instanteActual]);
        ticks = get(handles.axesVisorProceso,'XTick');
        set(handles.axesVisorProceso,'XTickLabel', periodo*ticks'/1000);
    end
    if find(instantes == 1)
        global setDeControl;
        configuracion = getConfiguracion(setDeControl);
        legend(handles.axesVisorProceso, 'Nivel', 'Actuador', getLeyendaValorReferencia(configuracion), 2);
    end
end