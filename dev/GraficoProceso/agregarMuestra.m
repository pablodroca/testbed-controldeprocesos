function agregarMuestra(visorDelProceso, instante, muestra)
fprintf('valor recibido en instante %d. VAlor: %f\n', instante, muestra);
handles = guihandles(visorDelProceso);
set(handles.txtMuestra, 'String', instante);
set(handles.txtNivel, 'String', muestra);
end