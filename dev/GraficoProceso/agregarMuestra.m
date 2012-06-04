function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end, 1));
	set(handles.txtInstante, 'String', instantes(end, 1));

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
    
    instanteActual = instantes(2);
    global configuracionAvanzada;
    config = configuracionAvanzada;
    maxValueX = getEjeTemporal(config) * (getPeriodo(config)/1000);
    if instanteActual > maxValueX
        xlim(handles.axesVisorProceso, [instanteActual-maxValueX instanteActual]);
    end
end