local ML = MenuLib

return function(v, props)
	if ML.client.menuTime < 3 then return false; end
	if (ML.client.currentMenu.id == -1) then return false; end
	
	if ML.HUD.stage_item.name == "drawMenus"
	and (ML.client.popup_id ~= -1)
		return false
	end
	
	local m_x = ML.client.mouse_x / FU
	local m_y = ML.client.mouse_y / FU
	
	if ((m_x >= props.x) and (m_x <= props.x + props.width))
	and ((m_y >= props.y) and (m_y <= props.y + props.height))
		return true
	end
	return false
end