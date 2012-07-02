function [ self ] = agregarCambioConfiguracion( self, configuracion )
    c.instante = getUltimosInstantes(self, 1);
    c.configuracion = configuracion;
    self.cambiosConfiguracion{length(self.cambiosConfiguracion) + 1}= c;