local path = ML.root .. "Functions/Libs/"

local tree = {
	"clamp",
	"interpolate",
	"addMenu",
	"initMenu",
	"findMenu",
}

for k, name in ipairs(tree)
	MenuLib[name] = dofile(path .. name)
end