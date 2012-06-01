function [ self, valido ] = modificarParametroSetPoint( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setSetPoint(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end