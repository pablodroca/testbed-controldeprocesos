function self = establecerValorActuador( self, valor )
    self.ultimoActuadorDummy = valor;
    fprintf('ConexionDummy : Valor Actuador establecido: %f\n', valor);
end

