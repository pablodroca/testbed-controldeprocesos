function validarKi( self, ki )

minimo = 0; maximo = 3;
if ki < minimo || ki > maximo
    error('ConfiguracionControlAutomatico:parametro', sprintf('El valor ingresado no se encuentra dentro del rango permitido. Minimo permitido: %f. Maximo permitido: %f', minimo, maximo));
end