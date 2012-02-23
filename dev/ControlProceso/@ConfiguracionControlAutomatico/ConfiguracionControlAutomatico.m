function [ self ] = ConfiguracionControlAutomatico( modo )
   self = struct('a', 123);
   self.modo = modo;
   self = class(self, 'ConfiguracionControlAutomatico');
end

