function [ self, configuracion ] = importarDesdeArchivo( self, archivo )
    
   data = load(archivo);
    if ~isstruct(data) || ~find(strcmp(fieldnames(data), 'muestras')) || ~find(strcmp(fieldnames(data), 'comentarios')) ...
           || ~find(strcmp(fieldnames(data), 'leyendaMuestras')) || ~find(strcmp(fieldnames(data), 'configuracion')) || ~find(strcmp(fieldnames(data), 'cambiosConfiguracion'))
        error('Proceso:leer', 'El archivo indicado no posee las variables "muestras", "comentarios", "configuracion", "cambiosConfiguracion" y "leyendaMuestras", requeridos para el proceso.');
   end
    
    self.muestrasDummy = data.muestras;
    self.comentarios = data.comentarios;
    self.cambiosConfiguracion = data.cambiosConfiguracion;

    if strcmp(data.tipo, 'Manual')
        configuracion = ConfiguracionControlManual;
    else %if strcmp(data.tipo,'AutomaticoMatlab')
        configuracion = ConfiguracionControlAutomatico;
    end
    configuracion = importarStruct(configuracion, data.configuracion);
    
    