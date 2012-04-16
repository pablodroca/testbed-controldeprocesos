function [ self ] = Proceso( )
   self.muestras = [];
   self.instanteUltimaMuestra = 0;
   self.instanteInicioGrabacion = 0;
   self.archivo = '';
   self.modoGrabacion = false;
   self = class(self, 'Proceso');
end
