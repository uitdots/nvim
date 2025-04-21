local function render()
  return vim.fn.reg_recording() ~= "" and "%#St_cwd_sep# " or ""
end

return render
