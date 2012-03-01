function [ self ] = Conexion(modoConexion)
   self.modoConexion = modoConexion;
   self.conectado = 0;
   self.canalSensor = 1;
   self.canalActuador = 1;
   self.placa = 'null';
   self = class(self, 'Conexion');
end

