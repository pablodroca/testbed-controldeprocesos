function [ placa ] = RIAC_init
%RIAC_INIT Inicializa la placa RIAC para sensar valores.

        placa = actxserver('RiacQXControl.RiacQX');
        placa.ComBaudRate=57600;
        placa.ComPort=3;
        placa.ComOpen=1;
end

