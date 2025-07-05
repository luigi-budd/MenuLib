--MenuLib v1 written by luigi budd

if rawget(_G,"MenuLib")
	print("\x85MenuLib already loaded, aborting...")
	return
end

rawset(_G, "MenuLib",{})
local ML = MenuLib

ML.root = ""
function ML:dofile(...)
	local paths = {...}
	for k, file in ipairs(paths)
		dofile(ML.root .. file)
	end
end

-- Bootstrapper
ML:dofile(
	"Templates/boot.lua",
	"Client/boot.lua",
)