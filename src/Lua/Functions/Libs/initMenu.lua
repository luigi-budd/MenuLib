local ML = MenuLib

local function canExitMenu(layers)
	local canLeave = false
	
	if layers[#layers - 1] == nil
	or layers[#layers - 1] == -1
		canLeave = true
	end
	
	if #layers == 2
		canLeave = false
	end
	
	return canLeave
end

return function(id)
	if (isdedicatedserver) then return end
	
	--just opened
	if ML.client.currentMenu.id == -1
		ML.client.doMousePress = false
		ML.client.mouseTime = -1
		
		ML.client.menuLayer = 1
	end
	
	input.ignoregameinputs = true
	local layers = ML.client.currentMenu.layers
	
	--immediately close
	if id == -2
		input.ignoregameinputs = false
		
		ML.client.mouse_x = (BASEVIDWIDTH*FU) / 2
		ML.client.mouse_y = (BASEVIDHEIGHT*FU) / 2
		ML.client.currentMenu.layers = {}
		ML.client.currentMenu.id = -1
		ML.client.menuLayer = 0
		
		return
	end
	
	if id ~= -1
		table.insert(ML.client.currentMenu.layers, ML.client.currentMenu.id)
		
	--go backwards
	else
		--there is NOT an available submenu before this one, so exit
		if canExitMenu(layers)
			input.ignoregameinputs = false
			
			ML.client.mouse_x = (BASEVIDWIDTH*FU) / 2
			ML.client.mouse_y = (BASEVIDHEIGHT*FU) / 2
			ML.client.currentMenu.layers = {}
			ML.client.menuLayer = 0
			
		else
			id = layers[#layers]
			layers[#layers] = nil
		end
		
	end
	
	ML.client.currentMenu.id = id
end