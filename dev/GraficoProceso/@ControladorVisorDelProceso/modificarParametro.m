function self = modificarParametro( self, parametro, valorStr )
global setDeControl

	valor = str2num(valorStr);
	if isempty(valor)
		msgbox('El valor ingresado no es valido. Por favor ingrese un valor numerico', 'Error de Parametro', 'error');
	else
		setDeControl = modificar(setDeControl, parametro, valor);
	end
end

