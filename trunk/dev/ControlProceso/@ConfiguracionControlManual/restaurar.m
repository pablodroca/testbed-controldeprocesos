function self = restaurar( self, archivo)
    data = load(archivo);
    self.salidaManual = data.self.salidaManual;
end
