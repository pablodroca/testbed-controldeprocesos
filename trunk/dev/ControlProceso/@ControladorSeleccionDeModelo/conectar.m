function self = conectar( self,tipoSetDeControl, configuracion, modelo)

global testbedContexto
	switch tipoSetDeControl
        case 'Manual'
            testbedContexto.conexion = Conexion;
        case 'AutomaticoMatlab'
            testbedContexto.conexion = Conexion;
        case 'AutomaticoABB'
            error('testbed:conectar', 'El tipo de Set de Control Automatico - ABB no esta disponible en esta version del sistema.');
        case 'Reproduccion'
            global testbedContexto;
            [filename, filepath] = uigetfile({'*.mat'}, 'Seleccionar archivo de reproduccion...', strcat(testbedContexto.directorioInicio, '/Grabaciones/'));
            if ~filename
                return;
            end
            archivo = strcat(filepath, filename);
            testbedContexto.conexion = ConexionDummy;
            [testbedContexto.conexion,configuracion] = importarDesdeArchivo(testbedContexto.conexion, archivo); 
        otherwise
            error('testbed:conectar', 'Tipo de Set de Control invalido.');
	end    
    testbedContexto.conexion = crearYConectar(testbedContexto.conexion);
    
    
	proceso = Proceso;
    proceso = setConfiguracionInicial(proceso, configuracion);
    switch tipoSetDeControl
        case 'AutomaticoABB'
            testbedContexto.setDeControl = SetDeControlABB(modelo, configuracion);
        otherwise
            testbedContexto.setDeControl = SetDeControlMatlab(modelo, configuracion);
    end
    iniciar(testbedContexto.setDeControl);
    try
        VisorDelProcesoGUI( self.vista, proceso, modelo, tipoSetDeControl);
    catch
        %los errores de iniciacion del VisorDelProcesoGUI son controlados dentro de su iniciacion con su posterior destruccion.
        %No es necesario efectuar acciones con errores de GUI por no haber creado una figure en la accion anterior
    end
end

