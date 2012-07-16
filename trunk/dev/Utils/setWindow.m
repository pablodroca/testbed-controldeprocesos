function setWindow(name, handle)
global testbedContexto;
	if isempty(testbedContexto.windowHandles)
		testbedContexto.windowHandles = [{name, handle}];
	else
		index = find(strcmp(testbedContexto.windowHandles(:, 1), name));
		if index
			testbedContexto.windowHandles{index, 2} = handle;
		else
			testbedContexto.windowHandles = [testbedContexto.windowHandles;{name, handle}];
		end
	end
end