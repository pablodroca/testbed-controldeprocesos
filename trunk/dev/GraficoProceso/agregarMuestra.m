function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end));
	set(handles.txtInstante, 'String', instantes(end));

    line(instantes, muestras, 'Parent', handles.axesVisorProceso);
end