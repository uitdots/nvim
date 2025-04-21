local function render()
  if vim.b.disable_autoformat then
    return "%#St_gitIcons#󰁨 "
  end
  if not vim.b.disable_autoformat and not vim.g.disable_autoformat then
    return "%#St_Lsp#󰁨 "
  end
  return ""
end

return render
