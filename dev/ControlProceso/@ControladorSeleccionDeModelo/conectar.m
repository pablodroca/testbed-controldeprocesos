function self = conectar( self,tipoSetDeControl, configuracion, modelo)

global conexion
global setDeControl
	switch tipoSetDeControl
        case 'Manual'
            conexion = Conexion;
        case 'AutomaticoMatlab'
            conexion = Conexion;
        case 'AutomaticoABB'
            error('testbed:conectar', 'El tipo de Set de Control Automatico - ABB no esta disponible en esta version del sistema.');
        case 'Reproduccion'
            global directorioInicio;
            [filename, filepath] = uigetfile({'*.mat'}, 'Seleccionar archivo de reproduccion...', strcat(directorioInicio, '/Grabaciones/'));
            if ~filename
                return;
            end
            archivo = strcat(filepath, filename);
            conexion = ConexionDummy;
            [conexion,configuracion] = importarDesdeArchivo(conexion, archivo); 
        otherwise
            error('testbed:conectar', 'Tipo de Set de Control invalido.');
	end    
    conexion = crearYConectar(conexion);
    
    
	proceso = Proceso;
    proceso = setConfiguracionInicial(proceso, configuracion);
    switch tipoSetDeControl
        case 'AutomaticoABB'
            setDeControl = SetDeControlABB(modelo, configuracion);
        otherwise
            setDeControl = SetDeControlMatlab(modelo, configuracion);
    end
    iniciar(setDeControl);
    try
        VisorDelProcesoGUI( self.vista, proceso, modelo, tipoSetDeControl);
    catch
        %los errores de iniciacion del VisorDelProcesoGUI son controlados dentro de su iniciacion con su posterior destruccion.
        %No es necesario efectuar acciones con errores de GUI por no haber creado una figure en la accion anterior
    end
end

