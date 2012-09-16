function agregarMuestra(visorDelProceso, instantes, muestras, leyendaMuestras)
    handles = guihandles(visorDelProceso);
global testbedContexto;
    periodo = getPeriodo(testbedContexto.configuracionAvanzada);
    
    nivel = muestras(end, 1);
    tiempo = instantes(end, 1);
    actuador = muestras(end, 2);
	set(handles.txtNivel, 'String', nivel);
	set(handles.txtInstante, 'String', sprintf('%.1f',tiempo));
	set(handles.txtActuador, 'String', actuador);
    rectangle('Position', [0 0 20 100], 'Curvature', [0.1 0.1], 'FaceColor', [1 1 1]*206/255, 'Parent', handles.axesBarraTanque);
    rectangle('Position', [0 0 20 nivel], 'Curvature', [0.1 0.1], 'FaceColor', 'b', 'Parent', handles.axesBarraTanque);

    lineHandle = line(instantes, muestras, 'Parent', handles.axesVisorProceso);
    set(lineHandle,'LineWidth',2);
    instanteActual = instantes(2);
    maxValueX = getEjeTemporal(testbedContexto.configuracionAvanzada);
    if instanteActual > maxValueX
        xlim(handles.axesVisorProceso, [instanteActual-maxValueX instanteActual]);
    end
    if find(instantes == 1)
        global testbedContexto;
        configuracion = getConfiguracion(testbedContexto.setDeControl);
        legendHandle = legend(handles.axesVisorProceso, leyendaMuestras, 2);
        set(legendHandle,'FontSize',11);
    end
end