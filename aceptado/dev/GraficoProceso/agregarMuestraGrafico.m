function agregarMuestraGrafico(graficoDelProceso, instantes, muestras)
global testbedContexto;
    handles = guihandles(graficoDelProceso);
    if not(testbedContexto.graficoProcesoZoom)
      lineHandle = line(instantes, muestras, 'Parent', handles.axesGraficoDelProceso);
      set(lineHandle,'LineWidth',2);
      limitesActuales = xlim(handles.axesGraficoDelProceso);
      maxValueX = max(instantes);
      if limitesActuales(2) < maxValueX
        xlim(handles.axesGraficoDelProceso, [1 maxValueX]);
    end
end