function mostrarCuadroComentario(visorDelProceso)
    handles = guihandles(visorDelProceso);
    controls = [handles.txtComentario, handles.lblComentario, handles.frmComentario, handles.btnAgregarComentario];
    set(controls, 'Visible', 'on');
end