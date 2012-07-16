function [ self ] = ConexionDummy( )
global testbedContexto;
   periodoMs = getPeriodo(testbedContexto.configuracionAvanzada);
   self.ultimaMuestraDummy = 0;
   self.ultimoActuadorDummy = 0;
   self.clockUltimaMuestra = clock;
   self.segundosEntreMuestras = periodoMs / 1000;
   self.conectado = 0;
   self.canalSensor = 1;
   self.canalActuador = 2;
   self.placa = 'null';
   self.muestrasDummy = [];
   self.cambiosConfiguracion = {};
   self.comentarios = {};
   self.indiceUltimaMuestraDummy = 1;
   self.clockUltimaMuestraDummy = {};
   self.segundosErrorAcumulado = 0;
   timerFunction = 'global testbedContexto; testbedContexto.conexion = establecerUltimaMuestraDummy(testbedContexto.conexion);';
   self.timer = timer('Name', 'timerConexionDummy_establecerUltimaMuestra', 'BusyMode', 'drop', 'Period',self.segundosEntreMuestras * 0.01, 'ExecutionMode','fixedDelay', 'TimerFcn', timerFunction);
   self = class(self, 'ConexionDummy');
end

