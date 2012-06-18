function self = leer( self, archivo)
   data = load(archivo);
   self.muestras = data.muestras;
   self.instanteUltimaMuestra = size(self.muestras, 1);
   self.instanteInicioGrabacion = 0;
   self.archivo = '';
   self.modoGrabacion = false;
end

