local prefs = require("prefs.defaults")

local ok, overrides = pcall(require, "prefs.local")
if ok and type(overrides) == "table" then
	prefs = vim.tbl_deep_extend("force", prefs, overrides)
elseif not ok and not overrides:find("module 'prefs.local' not found", 1, true) then
	vim.notify(overrides, vim.log.levels.ERROR, { title = "Prefs" })
end

_G.Prefs = prefs

return prefs
