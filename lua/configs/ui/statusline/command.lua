local noice = nil

local function render()
  if package.loaded["noice"] == nil then
    return
  end

  if noice == nil then
    noice = require("noice.api")
  end

  ---@diagnostic disable-next-line: undefined-field
  return " %#St_gitIcons#󰌌 " .. (noice.status.command.get() or "") .. " "
end

return render
