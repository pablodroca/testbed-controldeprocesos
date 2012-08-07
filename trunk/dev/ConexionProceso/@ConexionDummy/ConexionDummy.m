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
   self = class(self, 'ConexionDummy');
end

