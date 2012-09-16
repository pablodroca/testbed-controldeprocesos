function [ data ] = exportarStruct( self )    
data.self.setPoint = self.setPoint;
data.self.bias = self.bias;
data.self.kd = self.kd;
data.self.ki = self.ki;
data.self.kp = self.kp;