function [ self, valido ] = modificarParametroActuadorManual( self, valor )

valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setSalidaManual(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end