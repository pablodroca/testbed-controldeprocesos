function setWindow(name, handle)
global windowHandles
	if isempty(windowHandles)
		windowHandles = [{name, handle}];
	else
		index = find(strcmp(windowHandles(:, 1), name));
		if index
			windowHandles{index, 2} = handle;
		else
			windowHandles = [windowHandles;{name, handle}];
		end
	end
end