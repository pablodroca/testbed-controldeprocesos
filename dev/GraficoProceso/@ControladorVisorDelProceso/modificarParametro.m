function [self, valido] = modificarParametro( self, parametro, propiedad, valor )
global setDeControl
    if ~isnumeric(valor)
	    valor = str2num(valor);
    end
	if isempty(valor)
		msgbox('El valor ingresado no es valido. Por favor ingrese un valor numerico', 'Error de Parametro', 'error');
        valido = 0;
	else
		setDeControl = modificar(setDeControl, parametro, propiedad, valor);
        valido = 1;
	end
end

