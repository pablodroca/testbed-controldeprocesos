function [ self ] = ConfiguracionControlAutomatico( setPoint, bias, kp, ki, kd )
   if nargin == 0
       setPoint = 0;
       bias = 0;
       kp = 0;
       ki = 0;
       kd = 0;
   end
   self.setPoint = setPoint;
   self.bias = bias;
   self.kp = kp;
   self.ki = ki;
   self.kd = kd;
   self = class(self, 'ConfiguracionControlAutomatico');
   
   validarSetPoint(self, setPoint);
   validarBias(self, bias);
   validarKp(self, kp);
   validarKi(self, ki);
   validarKd(self, kd);
       
end

