function validarKd( self, kd )

minimo = 0; maximo = 3;
if kd < minimo || kd > maximo
    error('ConfiguracionControlAutomatico:parametro', sprintf('El valor ingresado no se encuentra dentro del rango permitido. Minimo permitido: %f. Maximo permitido: %f', minimo, maximo));
end