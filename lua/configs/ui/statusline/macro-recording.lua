local function render()
  if vim.fn.reg_recording() == "" then
    return
  end

  return "%#St_cwd_sep# "
end

return render
