---@type LazySpec
local specs = {}

for i, name in ipairs(Prefs.languages) do
	specs[i] = { import = "plugins.languages." .. name }
end

return specs
