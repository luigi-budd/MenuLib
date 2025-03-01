return function(v, menu)
	if ML.client.menuTime < 3 then return false; end
	if (ML.client.currentMenu.id == -1) then return false; end
	if (ML.client.menuLayer ~= ML.HUD.stage_id) then return false; end
	
	local m_x = ML.client.mouse_x / FU
	local m_y = ML.client.mouse_y / FU
	
	if ((m_x >= menu.x) and (m_x <= menu.x + menu.width))
	and ((m_y >= menu.y) and (m_y <= menu.y + 13))
		return true
	end
	return false
end