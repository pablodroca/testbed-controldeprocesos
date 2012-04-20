function handle = getWindow(name)
global windowHandles
	if isempty(windowHandles)
		error('lfd:getWindow', 'The current windows handles array is empty\n');
	else
		index = find(strcmp(windowHandles(:, 1), name));
		if index
			handle = windowHandles{index, 2};
		else
			error('lfd:getWindow', 'The given handle name was not found.');
		end	
	end
end
