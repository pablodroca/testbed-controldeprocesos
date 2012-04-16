function self = conectar( self, archivoSimulink )

global conexion
global setDeControl

    conexion = ConexionDummy(3);
    conexion = crearYConectar(conexion);
	proceso = Proceso;
	setDeControl = SetDeControlMatlab(archivoSimulink);
    
	VisorDelProcesoGUI( self.vista, proceso);    
end

