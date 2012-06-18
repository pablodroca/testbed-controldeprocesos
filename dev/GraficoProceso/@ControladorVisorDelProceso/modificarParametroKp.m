function [ self, valido ] = modificarParametroKp( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    try
        [configuracion, setDeControl] = setKp(configuracion, valor, setDeControl);
        setDeControl = setConfiguracion(setDeControl, configuracion);
    catch
        exception = lasterr;
        msgboxException('Error de Parametro', 'Parametro invalido.', exception);
        valido = false;
    end
end