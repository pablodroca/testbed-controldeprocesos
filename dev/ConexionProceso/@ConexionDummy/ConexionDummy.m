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
   data = importdata('muestras.mat');
   self.muestrasDummy = data.muestras;
   self.indiceUltimaMuestraDummy = 1;
   timerFunction = 'conexion = establecerUltimaMuestraDummy(conexion);';
   self.timer = timer('Period',self.msEntreMuestras / 1000.0, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
   self = class(self, 'ConexionDummy');
end

