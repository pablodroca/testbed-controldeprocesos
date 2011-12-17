SAMPLES_QTY = 400;


placa = RIAC_init;
inputs = zeros(SAMPLES_QTY,1);
for i = 1:SAMPLES_QTY
    inputs(i) = RIAC_get_input(placa, 1);
end

plot(inputs);

clear placa

