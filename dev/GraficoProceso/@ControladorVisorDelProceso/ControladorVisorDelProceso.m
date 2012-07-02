function [ self ] = ControladorVisorDelProceso(wVisorDelProceso, proceso, tipoSetDeControl)
	self.vista = wVisorDelProceso;
	self.proceso = proceso;
    self.tipoSetDeControl = tipoSetDeControl;
	self.timer = {};
	self.instanteUltimaMuestra = 0;
	self = class(self, 'ControladorVisorDelProceso');
end

