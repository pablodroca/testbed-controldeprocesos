function agregarMuestra(visorDelProceso, instante, muestra)
fprintf('VisorDelProceso: Valor recibido en instante %d. Valor: %f\n', instante, muestra);
handles = guihandles(visorDelProceso);
set(handles.txtMuestra, 'String', instante);
set(handles.txtNivel, 'String', muestra);

try %TODO remover el trycatch
	axes(handles.axesProceso);

	plot([instante, instante+1, instante+2, instante+3, instante+4], [muestra,  muestra*2, muestra/2, muestra/3, muestra*1.5])
catch
%hacer nada por ahora
end
end