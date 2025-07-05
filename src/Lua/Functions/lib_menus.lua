local ML = MenuLib

function ML:findMenu(name)
	for k,v in pairs(self.menus)
		if v.name == name
			return v
		end
	end
	return nil
end

function ML:addMenu(props)
	assert(props ~= nil and type(props) == "table", "MenuLib:addMenu() <- requires input of type \"table\"")
	assert(props.name ~= nil, "MenuLib:addMenu(table) <- table must have \"name\" field")
	assert(self:findMenu(props.name) == nil, "MenuLib:addMenu(table) <- \"name\" field must be unique (dupe of \""..props.name.."\")")

	setmetatable(props, {__index = self.protos.menu})
	self.menus[self.menu_incre] = props
	self.menu_incre = self.menu_incre + 1
	return props
end


function ML:closeMenu(flags)
end

function ML:openMenu(id)
end
