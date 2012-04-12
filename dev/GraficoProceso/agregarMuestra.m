function agregarMuestra(visorDelProceso, instante, muestra)
fprintf('valor recibido en instante %d. VAlor: %f\n', instante, muestra);
handles = guihandles(visorDelProceso);
set(handles.txtMuestra, 'String', instante);
set(handles.txtNivel, 'String', muestra);
axes(handles.axesVisorProceso)
plot([instante, instante+1, instante+2, instante+3, instante+4], [muestra,  muestra*2, muestra/2, muestra/3, muestra*1.5])
end