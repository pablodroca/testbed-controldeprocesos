function self = cargarProceso( self, archivo )
    proceso = Proceso;
	proceso = leer(proceso, archivo);
    GraficoDelProcesoGUI(proceso);
end

