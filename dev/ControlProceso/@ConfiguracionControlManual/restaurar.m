function self = restaurar( self, archivo)
    data = load(archivo);
    self = importarStruct(self, data);
end
