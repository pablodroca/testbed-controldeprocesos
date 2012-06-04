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
            conexion = ConexionDummy(strcat(filepath, filename));
        otherwise
            error('testbed:conectar', 'Tipo de Set de Control invalido.');
	end    
    conexion = crearYConectar(conexion);
    
    
	proceso = Proceso;
    switch tipoSetDeControl
        case 'AutomaticoABB'
            setDeControl = SetDeControlABB(modelo, configuracion);
        otherwise
            setDeControl = SetDeControlMatlab(modelo, configuracion);
    end
    iniciar(setDeControl);
	VisorDelProcesoGUI( self.vista, proceso, modelo, tipoSetDeControl);    
end

