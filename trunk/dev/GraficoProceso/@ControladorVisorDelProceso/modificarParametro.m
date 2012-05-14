function self = modificarParametro( self, parametro, propiedad, valorStr )
global setDeControl

	valor = str2num(valorStr);
	if isempty(valor)
		msgbox('El valor ingresado no es valido. Por favor ingrese un valor numerico', 'Error de Parametro', 'error');
	else
		setDeControl = modificar(setDeControl, parametro, propiedad, valor);
	end
end

