function ocultarCuadroComentario(visorDelProceso)
    handles = guihandles(visorDelProceso);
    controls = [handles.txtComentario, handles.lblComentario, handles.frmComentario, handles.btnAgregarComentario, handles.lstComentarios];
    set(controls, 'Visible', 'off');
end