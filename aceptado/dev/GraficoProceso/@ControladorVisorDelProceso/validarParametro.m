function [valor] = validarParametro( self, valor )
    if ~isnumeric(valor)
	    valor = str2num(valor);
    end
	if isempty(valor)
		msgbox('El valor ingresado no es valido. Por favor ingrese un valor numerico', 'Error de Parametro', 'error');
     end
end

