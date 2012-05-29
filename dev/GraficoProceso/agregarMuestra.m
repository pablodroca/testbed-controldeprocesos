function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end, 1));
	set(handles.txtInstante, 'String', instantes(end, 1));

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
end