function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end, 1));
	set(handles.txtInstante, 'String', instantes(end, 1));

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
    
    instanteActual = instantes(2);
    global configuracionAvanzada;
    config = configuracionAvanzada;
    maxValueX = getEjeTemporal(config) * (1000/getPeriodo(config));
    if instanteActual > maxValueX
        xlim(handles.axesVisorProceso, [instanteActual-maxValueX instanteActual]);
        
        ticks = get(handles.axesVisorProceso,'XTick');
        labels ={}; %zeros(length(ticks), 1);
        for ii=1:length(ticks); labels{ii}= num2str((getPeriodo(config)*ticks(ii))/1000); end
        set(handles.axesVisorProceso,'XTickLabel', labels);
    end
    if find(instantes == 1)
        global setDeControl;
        configuracion = getConfiguracion(setDeControl);
        legend(handles.axesVisorProceso, 'Nivel', 'Actuador', getLeyendaValorReferencia(configuracion));
    end
end