-- FIXME: This is not optimised, which can be improved by setting up auto command on window change and bufenter
local g = vim.g
local o = vim.o
local format = string.format

---@return string?
return function()
  if g.flutter_tools_decorations and g.flutter_tools_decorations.app_version then
    return format("%%#St_gitIcons# %s  ", o.columns > 100 and g.flutter_tools_decorations.app_version or "")
  end
end
