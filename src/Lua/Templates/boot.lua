local ML = MenuLib

ML.protos = {
	menu = {
		-- name is never defined, each menu must manually make one
		title = "Menu",
		
		x = 160, y = 100,
		width = 270,
		height = 170,
		
		color = 18,
		outline = -1,
		
		ms_flags = 0,
		ps_flags = 0,
		drawer = nullfunc,
	},
	
	button = {
		name = "Button",
		x = 0,y = 0,
		width = 50, height = 15,
		color = 8,
		outline = 16,
		
		selected = {
			color = 91,
			outline = 100,
		},
		
		pressFunc = nullfunc,
	},
	
	textinput = {
		tooltips = {},
		typesound = nil,
		deletesound = nil,
		
		onEscape = nullfunc,
		onPressEnter = nullfunc,
		
		bufferid = 0,
		buffer = "",
	},
}