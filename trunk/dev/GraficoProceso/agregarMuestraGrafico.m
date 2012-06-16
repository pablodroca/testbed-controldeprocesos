function agregarMuestraGrafico(graficoDelProceso, instantes, muestras)
    global graficoProcesoZoom;
    handles = guihandles(graficoDelProceso);
    if not(graficoProcesoZoom)
      line(instantes, muestras, 'Parent', handles.axesGraficoDelProceso);
      limitesActuales = xlim(handles.axesGraficoDelProceso);
      maxValueX = max([limitesActuales(2); instantes]);
      if limitesActuales(2) < maxValueX
        xlim(handles.axesGraficoDelProceso, [1 maxValueX]);
      end
    end
end