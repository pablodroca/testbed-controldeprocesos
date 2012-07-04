function self = notificarEventosGrabacion( self )
    global conexion
    
    instante = getUltimosInstantes(self.proceso, 1);
    instante = instante(1);
    
    cambioConfig = getCambioConfiguracionPorInstante(conexion, instante);
    comentario = getComentarioPorInstante(conexion, instante);
    if ~isempty(cambioConfig)
        registrarCambioConfiguracion(self.vista, cambioConfig);
    end
    if ~isempty(comentario)
       registrarCambioComentario(self.vista, comentario.texto);
   end