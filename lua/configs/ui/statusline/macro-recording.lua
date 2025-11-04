local reg_recording = vim.fn.reg_recording
local recording_string = "%#St_cwd_sep#  "

---@return string?
return function()
  if reg_recording() ~= "" then
    return recording_string
  end
end
