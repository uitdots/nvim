local g = vim.g
local requesting_string = "%#St_cwd_sep#󱙺  "

---@return string?
return function()
  if g.codecompanion_requesting then
    return requesting_string
  end
end
