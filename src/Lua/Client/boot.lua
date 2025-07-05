local ML = MenuLib

ML.client = {
	menuactive = false
	openmenus = {},
	currentmenu = nil, --menu_t
	
	mousex = BASEVIDWIDTH/2,
	mousey = BASEVIDHEIGHT/2,
	
	hoveringID = -1,
	
	textbuffer = {
		
	},
}
