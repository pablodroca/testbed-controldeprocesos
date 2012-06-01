function [ self, valido ] = modificarParametroKi( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setKi(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end