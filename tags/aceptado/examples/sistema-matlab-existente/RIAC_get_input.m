function [ input_sample ] = RIAC_get_input( placa, canal )
%RIAC_GET_INPUT Obtiene una muestra de la placa para el canal indicado
    input_sample = AnalogicInput(placa, canal)/1298*3;
end

