function [ self, valido ] = modificarParametroKd( self, valor )
valor = validarParametro(self, valor);
valido = ~isempty(valor);
if valido
    global testbedContexto
    configuracion = getConfiguracion(testbedContexto.setDeControl);
    try
        [configuracion, testbedContexto.setDeControl] = setKd(configuracion, valor, testbedContexto.setDeControl);
        testbedContexto.setDeControl = setConfiguracion(testbedContexto.setDeControl, configuracion);
        self.proceso = agregarCambioConfiguracion(self.proceso, configuracion);
    catch
        exception = lasterr;
        msgboxException('Error de Parametro', 'Parametro invalido.', exception);
        valido = false;
    end
end

