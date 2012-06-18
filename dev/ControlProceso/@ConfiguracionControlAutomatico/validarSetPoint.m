function validarSetPoint( self, setPoint )

minimo = 0; maximo = 100;
if setPoint < minimo || setPoint > maximo
    error('ConfiguracionControlAutomatico:parametro', sprintf('El valor ingresado no se encuentra dentro del rango permitido. Minimo permitido: %f. Maximo permitido: %f', minimo, maximo));
end