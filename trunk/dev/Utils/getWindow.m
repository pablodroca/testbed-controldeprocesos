function handle = getWindow(name)
global testbedContexto;
	if isempty(testbedContexto.windowHandles)
		error('lfd:getWindow', 'The current windows handles array is empty\n');
	else
		index = find(strcmp(testbedContexto.windowHandles(:, 1), name));
		if index
			handle = testbedContexto.windowHandles{index, 2};
		else
			error('lfd:getWindow', 'The given handle name was not found.');
		end	
	end
end
