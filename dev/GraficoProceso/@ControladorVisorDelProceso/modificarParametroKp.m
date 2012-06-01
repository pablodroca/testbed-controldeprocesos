function [ self, valido ] = modificarParametroKp( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setKp(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end