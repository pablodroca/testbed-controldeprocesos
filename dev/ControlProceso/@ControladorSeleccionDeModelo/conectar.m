function self = conectar( self,tipoSetDeControl)

global conexion
global setDeControl
	switch tipoSetDeControl
        case 'Manual'
            conexion = Conexion;
			archivoSimulink = 'UnTanque';
        case 'AutomaticoMatlab'
            conexion = Conexion;
			archivoSimulink = 'UnTanque';
        case 'AutomaticoABB'
            error('testbed:conectar', 'El tipo de Set de Control Automatico - ABB no esta disponible en esta version del sistema.');
        case 'Reproduccion'
            [filename, filepath] = uigetfile({'*.mat'}, 'Seleccionar archivo de reproduccion...', 'Grabaciones/');
            if ~filename
                return;
            end
            conexion = ConexionDummy(strcat(filepath, filename));
			archivoSimulink = 'UnTanque';
        otherwise
            error('testbed:conectar', 'Tipo de Set de Control invalido.');
	end
        
    conexion = crearYConectar(conexion);
	proceso = Proceso;
	setDeControl = SetDeControlMatlab(archivoSimulink);
    
	VisorDelProcesoGUI( self.vista, proceso, archivoSimulink);    
end

