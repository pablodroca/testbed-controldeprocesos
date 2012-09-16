function [ exists ] = existsWindow(name)
global testbedContexto;
	if isempty(testbedContexto.windowHandles)
	  exists = 0;	
	else
		index = find(strcmp(testbedContexto.windowHandles(:, 1), name));
		if index
			exists = 1;
		else
			exists = 0;
		end	
	end
end
