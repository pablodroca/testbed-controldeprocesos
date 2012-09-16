function validarSalidaManual(self, salidaManual )
minimo = 0; maximo = 100;
if salidaManual < minimo || salidaManual > maximo
    error('ConfiguracionControlManual:parametro', sprintf('El valor ingresado no se encuentra dentro del rango permitido. Minimo permitido: %f. Maximo permitido: %f', minimo, maximo));
end