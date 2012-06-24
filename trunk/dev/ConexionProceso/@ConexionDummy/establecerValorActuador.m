function self = establecerValorActuador( self, valor )
    self.ultimoActuadorDummy = valor;
    logDebug(sprintf('ConexionDummy : Valor Actuador establecido: %f\n', valor));
end

