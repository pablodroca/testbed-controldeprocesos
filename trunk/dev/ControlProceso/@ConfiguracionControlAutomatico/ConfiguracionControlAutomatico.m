function [ self ] = ConfiguracionControlAutomatico( setPoint, bias, kp, ki, kd )
   self.setPoint = setPoint;
   self.bias = bias;
   self.kp = kp;
   self.ki = ki;
   self.kd = kd;
   self = class(self, 'ConfiguracionControlAutomatico');
end

