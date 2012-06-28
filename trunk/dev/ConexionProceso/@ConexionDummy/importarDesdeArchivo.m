function [ self, configuracion ] = importarDesdeArchivo( self, archivo )
    
data = importdata(archivo);
if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios')) || ~find(strcmp(fieldnames(data), 'configuracion'))
    error('ConexionDummy:crearYConectar', 'El archivo indicado no posee las variables "muestras", "comentarios" y "configuracion", requeridos para la reproduccion');
end
    
self.muestrasDummy = data.muestras;
if strcmp(data.configuracion.tipoSetDeControl, 'Manual')
    configuracion = ConfiguracionControlManual;
elseif strcmp(data.configuracion.tipoSetDeControl,'AutomaticoMatlab')
    configuracion = ConfiguracionControlAutomatico;
end
configuracion = importarStruct(configuracion, data.configuracion);
    
    