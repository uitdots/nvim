local M = {}

---@type boolean?
M.ok = nil

---@module 'noice'
M.noice = nil

---@return string
function M.render()
  return string.format(" %%#St_gitIcons#󰌌 %s", M.noice.status.command.get() or "")
end

---@return string?
return function()
  if M.ok then
    return M.render()
  end

  if M.ok == nil then
    if package.loaded["noice"] == nil then
      return
    else
      M.ok, M.noice = pcall(require, "noice.api")
    end
  end

  if M.ok == false then
    return
  end

  return M.render()
end
