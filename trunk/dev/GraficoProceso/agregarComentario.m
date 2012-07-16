function agregarComentario( visorDelProceso, comentario )
    handles = guihandles(visorDelProceso);
    
    numero = getNumero(comentario);
    instante = getInstanteNormalizado(comentario);
    valor = getValorNormalizado(comentario);
    
    limitesActuales = xlim(handles.axesVisorProceso);
    tamX = (limitesActuales(2) - limitesActuales(1))/75;
    limitesActuales = ylim(handles.axesVisorProceso);
    tamY = (limitesActuales(2) - limitesActuales(1))/75;
    
      
    puntoHandle = text(instante, valor, 'O', 'Parent', handles.axesVisorProceso); 
    comentarioHandle = text(instante, valor+4*tamY, sprintf('%d', numero), 'Parent', handles.axesVisorProceso); 
    set(comentarioHandle,'FontSize',11);
    
    if numero == 1
        textos = {};
    else
        textos = get(handles.lstComentarios, 'String');
    end
    textos{length(textos)+1} = toString(comentario); 
    set(handles.lstComentarios, 'String', textos);