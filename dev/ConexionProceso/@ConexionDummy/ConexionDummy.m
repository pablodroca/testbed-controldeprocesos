function [ self ] = ConexionDummy( modoConexion )
   self.modoConexion = modoConexion;
   self.ultimaMuestraDummy = 0;
   self.ultimoActuadorDummy = 0;
   self.clockUltimaMuestra = clock;
   %self.msEntreMuestras = 20; %simula conexion 57600 baudrate.
   self.msEntreMuestras = 500;
   self.conectado = 0;
   self.canalSensor = 1;
   self.canalActuador = 2;
   self.placa = 'null';
   data = importdata('muestras.mat');
   self.muestrasDummy = data.muestras;
   self.indiceUltimaMuestraDummy = 1;
   timerFunction = 'global conexion; conexion = establecerUltimaMuestraDummy(conexion);';
   self.timer = timer('Name', 'timerConexionDummy_establecerUltimaMuestra', 'BusyMode', 'drop', 'Period',self.msEntreMuestras / 1000.0, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
   self = class(self, 'ConexionDummy');
end

