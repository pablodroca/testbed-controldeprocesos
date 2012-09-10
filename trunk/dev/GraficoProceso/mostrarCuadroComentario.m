function mostrarCuadroComentario(visorDelProceso)
    handles = guihandles(visorDelProceso);
    
    lstComentarioPosicion = get(handles.lstComentarios, 'Position');
    axesVisorPosicion = get(handles.axesVisorProceso, 'Position');
    nuevoAnchoAxes = lstComentarioPosicion(1) -  7 - axesVisorPosicion(1) ;
    axesVisorPosicion(3) = nuevoAnchoAxes;
    set(handles.axesVisorProceso, 'Position', axesVisorPosicion);
    controls = [handles.txtComentario, handles.lblComentario, handles.lblComentarios, handles.frmComentario, handles.btnAgregarComentario, handles.lstComentarios];
    set(controls, 'Visible', 'on');
end