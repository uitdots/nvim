local b = vim.b
local g = vim.g

local enabled_string = "%#St_Lsp#󰁨  "
local disabled_string = "%#St_gitIcons#󰁨  "

---@return string?
return function()
  if b.auto_format_enabled or (b.auto_format_enabled == nil and g.auto_format_enabled == true) then
    return enabled_string
  end
  if b.auto_format_enabled == false and g.auto_format_enabled == true then
    return disabled_string
  end
end
