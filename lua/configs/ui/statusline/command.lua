local noice = nil

return function()
  if package.loaded["noice"] == nil then
    return
  end

  if noice == nil then
    noice = require("noice.api")
  end

  ---@diagnostic disable-next-line: undefined-field
  return string.format(" %%#St_gitIcons#󰌌 %s ", noice.status.command.get() or "")
end
