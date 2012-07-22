function [ self ] = SetDeControlMatlab( modeloSimulink, configuracion)
global testbedContexto;
    logDebug(sprintf('Iniciando Set de Control Dummy\n'));
    self.configuracion = configuracion;
    self = class(self, 'SetDeControlDummy');
    testbedContexto.setDeControl = self;
end

