function mostrarCuadroComentario(visorDelProceso)
    handles = guihandles(visorDelProceso);
    controls = [handles.txtComentario, handles.lblComentario, handles.frmComentario, handles.btnAgregarComentario, handles.lstComentarios];
    set(controls, 'Visible', 'on');
end