function agregarMuestraGrafico(graficoDelProceso, instantes, muestras)
    global graficoProcesoZoom;
    handles = guihandles(graficoDelProceso);
    if not(graficoProcesoZoom)
      line(instantes, muestras, 'Parent', handles.axesGraficoDelProceso);
    end
end