
addpath('ConexionProceso');
addpath('ControlProceso');
addpath('GraficoProceso');
c = conexion(3);
desconectar(c)

c = ConfiguracionControlAutomatico();
guardar(c);
restaurar(c);