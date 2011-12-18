%guarda el valro original del path

originalPath=PATH;

%Seteo de rutas
addpath('gui');
addpath('sesion');
addpath('vistas');
addpath('aplicacion');
addpath('comunicacion_robot');
addpath('trayectoria');
addpath('entrada_salida');
addpath('raplib');

% Comienzo de interfaz grafica
main;

%Deja el valor del PATH original al finalizar.
PATH=originalPath;