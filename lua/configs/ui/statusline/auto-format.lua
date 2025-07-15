---@return string?
return function()
  if vim.b.auto_format_enabled or (vim.b.auto_format_enabled == nil and vim.g.auto_format_enabled == true) then
    return "%#St_Lsp#󰁨  "
  end
  if vim.b.auto_format_enabled == false and vim.g.auto_format_enabled == true then
    return "%#St_gitIcons#󰁨  "
  end
end
