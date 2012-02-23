%in order to make this version compatible with Matlab 6.5, disable warnings
warning off MATLAB:m_warning_end_without_block

addpath('ConexionProceso');
addpath('ControlProceso');
addpath('GraficoProceso');


SAMPLES_QTY = 100;

c = Conexion(3);
c = crearYConectar(c);


muestras = zeros(SAMPLES_QTY);
for i = 1:SAMPLES_QTY
    muestras(i) = obtenerMuestra(c);
end

plot(muestras);

desconectar(c);
