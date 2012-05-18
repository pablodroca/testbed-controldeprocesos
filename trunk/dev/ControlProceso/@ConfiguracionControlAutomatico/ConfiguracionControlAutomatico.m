function [ self ] = ConfiguracionControlAutomatico( setPoint, bias, kp, ki, kd )
   if nargin == 0
       self.setPoint = 0;
       self.bias = 0;
       self.kp = 0;
       self.ki = 0;
       self.kd = 0;
   else
       
       self.setPoint = setPoint;
       self.bias = bias;
       self.kp = kp;
       self.ki = ki;
       self.kd = kd;
   end
   self = class(self, 'ConfiguracionControlAutomatico');
end

