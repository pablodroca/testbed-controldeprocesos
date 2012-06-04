function self = crearYConectar( self )
%crearYConectar Inicializa la conexión para sensar valores.
    self.placa = actxserver('RiacQXControl.RiacQX');
    global configuracionAvanzada
    self.placa.ComBaudRate= getVelocidad(configuracionAvanzada); % ejemplo: 57600 -> Periodo de lectura: T=20ms
    self.placa.ComPort=getPuerto(configuracionAvanzada); ;
    self.placa.ComOpen=1;
    self.conectado = 1;
end

