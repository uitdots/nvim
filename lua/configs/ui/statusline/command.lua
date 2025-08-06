local M = {}

---@type boolean?
M.ok = nil

---@type (fun(): string)?
M.get_command = nil

---@return string
function M.render()
  return string.format("%%#St_gitIcons#󰌌 %s ", M.get_command() or "")
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
      local noice
      M.ok, noice = pcall(require, "noice.api")
      if M.ok then
        ---@diagnostic disable-next-line: undefined-field
        M.get_command = noice.status.command.get
      end
    end
  end

  if M.ok == false then
    return
  end

  return M.render()
end
