function [ self, configuracion ] = importarDesdeArchivo( self, archivo )
    
data = importdata(archivo);
if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios')) || ~find(strcmp(fieldnames(data), 'configuracion'))
    error('ConexionDummy:crearYConectar', 'El archivo indicado no posee las variables "muestras", "comentarios" y "configuracion", requeridos para la reproduccion');
end
    
self.muestrasDummy = data.muestras;
if strcmp(data.tipo, 'Manual')
    configuracion = ConfiguracionControlManual;
else %if strcmp(data.tipo,'AutomaticoMatlab')
    configuracion = ConfiguracionControlAutomatico;
end
configuracion = importarStruct(configuracion, data.configuracion);
    
    