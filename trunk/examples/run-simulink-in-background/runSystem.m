function [  ] = runSystem(  )

load_system('SimulinkModel.mdl');
fprintf('Begining System...\n');
set_param('SimulinkModel', 'SimulationCommand', 'start');
fprintf(' System started...\n');