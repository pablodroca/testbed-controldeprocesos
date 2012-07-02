function [ self, valido ] = modificarParametroKi( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global setDeControl
    configuracion = getConfiguracion(setDeControl);
    try
        [configuracion, setDeControl] = setKi(configuracion, valor, setDeControl);
        setDeControl = setConfiguracion(setDeControl, configuracion);
        self.proceso = agregarCambioConfiguracion(self.proceso, configuracion);
    catch
        exception = lasterr;
        msgboxException('Error de Parametro', 'Parametro invalido.', exception);
        valido = false;
    end
end