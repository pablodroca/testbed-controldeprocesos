function self = conectar( self, archivoSimulink )

global conexion
global setDeControl

    conexion = ConexionDummy(3);
    conexion = crearYConectar(conexion);
	setDeControl = SetDeControlMatlab(archivoSimulink);
    
	VisorDelProcesoGUI('wSeleccionDeModelo', 'dummy');    
end

