function [ self ] = ConexionDummy( )
   global configuracionAvanzada;
   periodoMs = getPeriodo(configuracionAvanzada);
   self.ultimaMuestraDummy = 0;
   self.ultimoActuadorDummy = 0;
   self.clockUltimaMuestra = clock;
   self.msEntreMuestras = periodoMs;
   self.conectado = 0;
   self.canalSensor = 1;
   self.canalActuador = 2;
   self.placa = 'null';
   self.muestrasDummy = [];
   self.cambiosConfiguracion = {};
   self.comentarios = {};
   self.indiceUltimaMuestraDummy = 1;
   timerFunction = 'global conexion; conexion = establecerUltimaMuestraDummy(conexion);';
   self.timer = timer('Name', 'timerConexionDummy_establecerUltimaMuestra', 'BusyMode', 'drop', 'Period',self.msEntreMuestras / 1000.0, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
   self = class(self, 'ConexionDummy');
end

