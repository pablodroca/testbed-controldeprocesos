function registrarCambioComentario( visorDelProceso, textoComentario )
w = getWindow('VisorDelProceso');
w.controlador = agregarComentario(w.controlador, textoComentario);
setWindow('VisorDelProceso', w);
