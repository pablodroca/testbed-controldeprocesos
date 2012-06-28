function [ self ] = Proceso( )
   global configuracionAvanzada;
   self.periodo = getPeriodo(configuracionAvanzada);
   self.muestras = [];
   self.comentarios = {};
   self.instanteUltimaMuestra = 0;
   self.instanteInicioGrabacion = 0;
   self.archivo = '';
   self.modoGrabacion = false;
   self.configuracionInicial = {};
   self.leyendaMuestras = {};
   self.cambiosConfiguracion = {};
   self = class(self, 'Proceso');
end
