function self = notificarEventosGrabacion( self )
    global testbedContexto
    
    instante = getUltimosInstantes(self.proceso, 1);
    instante = instante(1);
    
    cambioConfig = getCambioConfiguracionPorInstante(testbedContexto.conexion, instante);
    comentario = getComentarioPorInstante(testbedContexto.conexion, instante);
    if ~isempty(cambioConfig)
        registrarCambioConfiguracion(self.vista, cambioConfig);
    end
    if ~isempty(comentario)
       registrarCambioComentario(self.vista, comentario.texto);
   end