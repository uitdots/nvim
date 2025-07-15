---@return string?
return function()
  if vim.g.codecompanion_requesting then
    return "%#St_cwd_sep#󱙺  "
  end
end
