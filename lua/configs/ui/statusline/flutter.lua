local function render()
  if vim.g.flutter_tools_decorations and vim.g.flutter_tools_decorations.app_version then
    return "%#St_gitIcons# " .. (vim.o.columns > 100 and vim.g.flutter_tools_decorations.app_version or "") .. " "
  end
  return ""
end

return render
