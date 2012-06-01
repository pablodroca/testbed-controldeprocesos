function [ self, valido ] = modificarParametroKd( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    [configuracion, setDeControl] = setKd(configuracion, valor, setDeControl);
    setDeControl = setConfiguracion(setDeControl, configuracion);
end

