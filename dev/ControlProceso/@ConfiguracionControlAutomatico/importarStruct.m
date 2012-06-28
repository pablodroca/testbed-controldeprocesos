function [ self ] = importarStruct( self, data )
    self.setPoint = data.self.setPoint;
    self.bias = data.self.bias;
    self.kd = data.self.kd;
    self.ki = data.self.ki;
    self.kp = data.self.kp;
end