---@return string?
return function()
  if vim.fn.reg_recording() ~= "" then
    return "%#St_cwd_sep#  "
  end
end
