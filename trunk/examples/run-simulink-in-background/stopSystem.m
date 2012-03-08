function [  ] = stopSystem(  )

fprintf('Stoping System...\n');
set_param('SimulinkModel', 'SimulationCommand', 'stop');
fprintf(' System stopped...\n');