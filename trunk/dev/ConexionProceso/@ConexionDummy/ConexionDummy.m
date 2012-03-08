function [ self ] = ConexionDummy( modoConexion )
   self.modoConexion = modoConexion;
   self.ultimaMuestraDummy = 0;
   self.ultimoActuadorDummy = 0;
   self.clockUltimaMuestra = clock;
   self.msEntreMuestras = 20; %simula conexion 57600 baudrate.
   self.conectado = 0;
   self.canalSensor = 1;
   self.canalActuador = 2;
   self.placa = 'null';
   self = class(self, 'ConexionDummy');
end

