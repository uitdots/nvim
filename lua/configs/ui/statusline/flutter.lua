---@return string?
return function()
  if vim.g.flutter_tools_decorations and vim.g.flutter_tools_decorations.app_version then
    return string.format("%%#St_gitIcons# %s  ", vim.o.columns > 100 and vim.g.flutter_tools_decorations.app_version or "")
  end
end
