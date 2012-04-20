function [ self ] = ControladorVisorDelProceso(wVisorDelProceso, proceso)
	self.vista = wVisorDelProceso;
	self.proceso = proceso;
	self.timer = {};
	self.instanteUltimaMuestra = 0;
	self = class(self, 'ControladorVisorDelProceso');
end

