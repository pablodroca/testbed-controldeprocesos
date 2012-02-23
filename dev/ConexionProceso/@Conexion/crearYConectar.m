function self = crearYConectar( self )
%crearYConectar Inicializa la conexión para sensar valores.
    self.placa = actxserver('RiacQXControl.RiacQX');
    self.placa.ComBaudRate=57600;
    self.placa.ComPort=3;
    self.placa.ComOpen=1;
    self.conectado = 1;
end

