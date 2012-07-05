function agregarMuestraGrafico(graficoDelProceso, instantes, muestras)
    global graficoProcesoZoom;
    handles = guihandles(graficoDelProceso);
    if not(graficoProcesoZoom)
      lineHandle = line(instantes, muestras, 'Parent', handles.axesGraficoDelProceso);
      set(lineHandle,'LineWidth',2);
      limitesActuales = xlim(handles.axesGraficoDelProceso);
      maxValueX = max(instantes);
      if limitesActuales(2) < maxValueX
        xlim(handles.axesGraficoDelProceso, [1 maxValueX]);
        global configuracionAvanzada;
        config = configuracionAvanzada;
        ticks = get(handles.axesGraficoDelProceso,'XTick');
        set(handles.axesGraficoDelProceso,'XTickLabel', getPeriodo(config)*ticks'/1000);
    end
end