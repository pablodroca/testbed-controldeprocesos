function agregarMuestra(visorDelProceso, instantes, muestras)
    handles = guihandles(visorDelProceso);
	set(handles.txtNivel, 'String', muestras(end));
	set(handles.txtInstante, 'String', instantes(end));


	try %TODO remover el trycatc
		%axes(handles.axesVisorProceso);
		%line('XData',[instante, instante+1, instante+2, instante+3, instante+4], 'YData', [muestra,  muestra*2, muestra/2, muestra/3, muestra*1.5]);
		%figure(visorDelProceso);
		%axes(visorDelProceso.axesisorProceso);
        line(instantes, muestras, 'Parent', handles.axesVisorProceso);
		%plot([instante, instante+1, instante+2, instante+3, instante+4], [muestra,  muestra*1.2, muestra*1.3, muestra*1.5, muestra*3]);
	catch
	 exception = lasterr;
	 disp('Excepcion encontrada');
	 disp(exception);
	end
end