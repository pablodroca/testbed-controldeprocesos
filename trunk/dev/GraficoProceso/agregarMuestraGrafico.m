function agregarMuestraGrafico(graficoDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end));
	set(handles.txtInstante, 'String', instantes(end));

	try 
        line(instantes, muestras, 'Parent', handles.axesGraficoDelProceso);
        try
          %line(instantes, muestras, 'Parent', handles.graficoDelProceso.axesGraficoDelProceso);
        catch
          %no hacer nada por el momento  
        end
	catch
	 exception = lasterr;
	 disp('Excepcion encontrada');
	 disp(exception);
	end
end