local function render()
  if vim.b.autoformat_enabled or (vim.b.autoformat_enabled == nil and vim.g.autoformat_enabled == true) then
    return "%#St_Lsp#󰁨  "
  end
  if vim.b.autoformat_enabled == false and vim.g.autoformat_enabled == true then
    return "%#St_gitIcons#󰁨  "
  end
  return ""
end

return render
