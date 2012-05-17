function [ self ] = ControladorGraficoDelProceso( wGraficoDelProceso, proceso)
	self.vista = wGraficoDelProceso;
	self.proceso = proceso;
	self = class(self, 'ControladorGraficoDelProceso');
end

