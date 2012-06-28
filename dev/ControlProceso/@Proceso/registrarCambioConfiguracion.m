function [ self ] = registrarCambioConfiguracion( self, configuracion )
cambioConfig.instante = self.instanteUltimaMuestra;
cambioConfig.configuracion = exportarStruct(configuracion);
self.cambiosConfiguracion{length(self.cambiosConfiguracion)+1} = cambioConfig);