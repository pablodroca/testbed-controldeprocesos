function self = crearYConectar(self)
    data = importdata(self.archivo);
    if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios'))
        error('ConexionDummy:crearYConectar', 'El archivo indicado no posee las variables "muestras" y "comentarios", requeridos para la reproduccion');
    end
    
    self.muestrasDummy = data.muestras;
    fprintf('ConexionDummy: Conectado\n');
    self.conectado = 1;
	start(self.timer);
end

