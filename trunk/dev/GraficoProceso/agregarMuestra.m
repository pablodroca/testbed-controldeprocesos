function agregarMuestra(visorDelProceso, instante, muestra)
fprintf('VisorDelProceso: Valor recibido en instante %d. Valor: %f\n', instante, muestra);
handles = guihandles(visorDelProceso);
set(handles.txtMuestra, 'String', instante);
set(handles.txtNivel, 'String', muestra);

try %TODO remover el trycatc
	%axes(handles.axesVisorProceso);
    %line('XData',[instante, instante+1, instante+2, instante+3, instante+4], 'YData', [muestra,  muestra*2, muestra/2, muestra/3, muestra*1.5]);
    disp('Grafico instante: ')
    instante
    disp('Muestra: ');
    muestra
    %figure(visorDelProceso);
    %axes(visorDelProceso.axesisorProceso);
    plot([instante, instante+1, instante+2, instante+3, instante+4], [muestra,  muestra*1.2, muestra*1.3, muestra*1.5, muestra*3]);
catch
 exception = lasterr;
 disp('Excepcion encontrada');
 disp(exception);
end
end