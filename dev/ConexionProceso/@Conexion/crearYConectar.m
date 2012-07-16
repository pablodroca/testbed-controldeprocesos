function self = crearYConectar( self )
%crearYConectar Inicializa la conexión para sensar valores.
global testbedContexto;
    velocidad = getVelocidad(testbedContexto.configuracionAvanzada); % ejemplo: 57600 -> Periodo de lectura: T=20ms
    puerto = getPuerto(testbedContexto.configuracionAvanzada);

    self.placa = actxserver('RiacQXControl.RiacQX');
    try
        self.placa.ComBaudRate = velocidad;
    catch
        error('Conexion:crearYConectar', sprintf('No fue posible realizar una conexion con velocidad %d. Controle que el valor sea correcto.', velocidad));
    end
    try
        self.placa.ComPort = puerto;
    catch
        error('Conexion:crearYConectar', sprintf('No fue posible realizar una conexion mediante el puerto COM %d. Controle que el valor sea correcto.', puerto));
    end
    self.placa.ComOpen=1;
    self.conectado = 1;
    if strcmp(self.placa.ErrNumber, 'PortAlredyOpen')
        error('Conexion:crearYConectar', sprintf('El puerto COM %d utilizado por la RIAC se encuentra abierto por otro aplicativo. No es posible conectarse con la placa', puerto));
    elseif strcmp(self.placa.ErrNumber, 'InvalidPort')
        error('Conexion:crearYConectar', sprintf('El puerto COM %d no es un puerto RIAC valido. No es posible conectarse con la placa', puerto));
    elseif ~strcmp(self.placa.ErrNumber, 'NoError')
        error('Conexion:crearYConectar', sprintf('Ha ocurrido un error desconocido durante la conexion con la placa RIAC. Codigo de error: (%s)', self.placa.ErrNumber));
    end
    %chequeo de la conexion con la placa. BaudRate puede ser incorrecto.
    nivel = AnalogicInput(self.placa, self.canalSensor);
    if ~strcmp(self.placa.ErrNumber, 'NoError')
        error('Conexion:crearYConectar', sprintf('Ha ocurrido un error durante la prueba de adquisicion de datos de la placa RIAC. Controle que la velocidad (%d) y puerto COM (%d) sean correctos. Codigo de error: (%s)', velocidad, puerto, self.placa.ErrNumber));
    end
end

