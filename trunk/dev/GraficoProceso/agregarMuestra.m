function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
    %bar(muestras(end, 1), 'Parent', handles.axesBarraTanque);
	set(handles.txtNivel, 'String', muestras(end, 1));
	set(handles.txtInstante, 'String', instantes(end, 1));

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
    
    instanteActual = instantes(2);
    global configuracionAvanzada;
    periodo = getPeriodo(configuracionAvanzada);
    maxValueX = getEjeTemporal(configuracionAvanzada) * (1000/periodo);
    if instanteActual > maxValueX
        xlim(handles.axesVisorProceso, [instanteActual-maxValueX instanteActual]);
        ticks = get(handles.axesVisorProceso,'XTick');
        set(handles.axesVisorProceso,'XTickLabel', getPeriodo(config)*ticks'/1000);
    end
    if find(instantes == 1)
        global setDeControl;
        configuracion = getConfiguracion(setDeControl);
        legend(handles.axesVisorProceso, 'Nivel', 'Actuador', getLeyendaValorReferencia(configuracion), 2);
    end
end