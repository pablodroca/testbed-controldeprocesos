function [ exists ] = existsWindow(name)
global windowHandles
	if isempty(windowHandles)
	  exists = 0;	
	else
		index = find(strcmp(windowHandles(:, 1), name));
		if index
			exists = 1;
		else
			exists = 0;
		end	
	end
end
