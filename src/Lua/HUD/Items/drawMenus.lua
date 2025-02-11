local ML = MenuLib

ML.addMenu({
	stringId = "BoobMenu",
	title = "Booooooob",
	
	drawer = function(v, ML, props)
		local corner_x = props.corner_x + 10
		local corner_y = props.corner_y + 18
		
		ML.addButton(v, {
			id = 1,
			
			x = corner_x,
			y = corner_y,
			
			width = 68,
			height = 20,
			
			name = "Example",
			color = 5,
			
			selected = {
				color = 83
			},
			
			pressFunc = function()
				print("Example 1!!!!!!!")
			end
		})
		
		ML.addButton(v, {
			id = 2,
			
			x = corner_x + 70,
			y = corner_y,
			
			width = 68,
			height = 20,
			
			name = "Example2",
			color = 6,
			
			selected = {
				color = 83
			},
			
			pressFunc = function()
				print("Example 2!!!!!!!")
			end
		})
		
		ML.addButton(v, {
			id = 3,
			
			x = corner_x + 140,
			y = corner_y,
			
			width = 68,
			height = 20,
			
			name = "Example3",
			color = 7,
			
			selected = {
				color = 83
			},
			
			pressFunc = function()
				print("Example 3!!!!!!!")
			end
		})
		
		ML.addButton(v, {
			id = 4,
			
			x = corner_x + 210,
			y = corner_y,
			
			width = 68,
			height = 20,
			
			name = "Example4",
			color = 8,
			
			selected = {
				color = 83
			},
			
			pressFunc = function()
				ML.initMenu(ML.findMenu("BoobMenu2"))
			end
		})
		
		v.draw(corner_x + 2,
			corner_y + 22,
			v.cachePatch("HOLYMOLY"),
			0
		)
	end,
})

ML.addMenu({
	stringId = "BoobMenu2",
	title = "Boob-SubMenu",
	outline = 13,

	drawer = function(v, ML, props)
		local corner_x = props.corner_x + 10
		local corner_y = props.corner_y + 18
		
		ML.addButton(v, {
			id = 1,
			
			x = corner_x,
			y = corner_y,
			
			width = 80,
			height = 50,
			
			name = "Go Deeper!",
			color = 5,
			
			selected = {
				color = 83
			},
			
			pressFunc = function()
				ML.initMenu(ML.findMenu("BoobMenu3"))
			end
		})
	end
})
ML.addMenu({
	stringId = "BoobMenu3",
	title = "Boob-SubMenu-2",
	outline = 13,
})

return function(v,ML)
	if ML.client.currentMenu.id == -1 then return end
	
	local menu = ML.menus[ML.client.currentMenu.id]
	
	local corner_x = (BASEVIDWIDTH/2) - (menu.width/2)
	local corner_y = (BASEVIDHEIGHT/2) - (menu.height/2)
	
	if (menu.outline ~= nil)
		v.drawFill(
			corner_x - 1, corner_y - 1,
			menu.width + 2, menu.height + 2,
			menu.outline
		)
	end
	
	v.drawFill(
		corner_x, corner_y,
		menu.width, menu.height,
		menu.color
	)
	
	v.drawString(corner_x + 2,
		corner_y + 2,
		menu.title,
		V_ALLOWLOWERCASE,
		"left"
	)
	
	do --if (ML.client.currentMenu.prevId ~= -1)
		ML.addButton(v, {
			x = (BASEVIDWIDTH/2) + (menu.width/2) - 25,
			y = corner_y,
			width = 25,
			height = 13,
			
			name = ML.client.currentMenu.layers[#ML.client.currentMenu.layers - 1] ~= nil and "Back" or "Exit",
			color = 27,
			
			pressFunc = function()
				ML.initMenu(-1)
			end
		})
	end
	
	v.drawFill(corner_x, corner_y + 13,
		menu.width, 1,
		0
	)
	
	if (menu.drawer ~= nil)
		menu.drawer(v, ML, {
			corner_x = corner_x,
			corner_y = corner_y,
		})
	end
end