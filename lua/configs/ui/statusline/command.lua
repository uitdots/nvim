local noice = require("noice.api")

local function render()
  ---@diagnostic disable-next-line: undefined-field
  return " %#St_gitIcons#󰌌 " .. (noice.status.command.get() or "") .. " "
end

return render
