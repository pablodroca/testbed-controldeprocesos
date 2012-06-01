function [ self, valido ] = modificarParametroBias( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setBias(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end
