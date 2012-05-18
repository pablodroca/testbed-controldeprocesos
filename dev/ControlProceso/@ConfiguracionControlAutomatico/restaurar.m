function self = restaurar( self, archivo )
    data = load(archivo);
    self.setPoint = data.self.setPoint;
    self.bias = data.self.bias;
    self.kd = data.self.kd;
    self.ki = data.self.ki;
    self.kp = data.self.kp;
end

