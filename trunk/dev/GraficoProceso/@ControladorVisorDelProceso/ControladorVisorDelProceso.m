function [ self ] = ControladorVisorDelProceso(wVisorDelProceso)
   self = struct('vista', wVisorDelProceso);
   self = class(self, 'ControladorVisorDelProceso');
   global ControladorVisorDelProcesoSelf
   ControladorVisorDelProcesoSelf = self;
   timer3 = timer('Period',0.5, 'ExecutionMode','fixedDelay', 'TimerFcn', ...
        'fprintf(''%d'', muestraTimer); muestraTimer =  muestraTimer + 1; conexion = establecerUltimaMuestraDummy(conexion, muestraTimer); muestras = [muestras muestraTimer];procesarMuestra(ControladorVisorDelProcesoSelf, muestraTimer);');
   start(timer3);
end

