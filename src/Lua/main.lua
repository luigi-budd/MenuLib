local ML = MenuLib

addHook("PreThinkFrame", do
	print(leveltime.." prethink")
	if ML.client.doMousePress
		if ML.client.mouseTime == -1
			ML.client.mouseTime = 0
		else
			ML.client.doMousePress = false
			ML.client.mouseTime = -1
		end
	end
	
	if (ML.client.mouseDown)
		ML.client.lastMouseDownTic = ML.client.mouseDownTic
	end
	
	ML.client.menuactive = false
	if ML.client.currentMenu.id == -1
		ML.client.currentMenu.layers = {}
		ML.client.menuTime = 0
		return
	end
	ML.client.menuactive = true
	ML.client.menuTime = $ + 1
	
	ML.client.mouse_x = $ + mouse.dx * 3700
	ML.client.mouse_y = $ + mouse.dy * 3700
	
	ML.client.mouse_x = ML.clamp(0, $, BASEVIDWIDTH*FU)
	ML.client.mouse_y = ML.clamp(0, $, BASEVIDHEIGHT*FU)
end)

--keydown runs before prethink
addHook("KeyDown", function(key)
	print(leveltime.." KeyDown")
	if isdedicatedserver then return end
	if (ML.client.menuTime < 2)
		ML.client.doMousePress = false
		ML.client.mouseTime = -1
		return
	end
	
	if key.name == "mouse1"
		if not key.repeated
			ML.client.doMousePress = true
		end
		ML.client.mouseDown = true
		ML.client.mouseDownTic = $ + 1
	end
end)