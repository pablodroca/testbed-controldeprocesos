function validarBias(self, bias )
minimo = 0; maximo = 100;
if bias < minimo || bias > maximo
    error('ConfiguracionControlAutomatico:parametro', sprintf('El valor ingresado no se encuentra dentro del rango permitido. Minimo permitido: %f. Maximo permitido: %f', minimo, maximo));
end