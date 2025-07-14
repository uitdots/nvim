local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string?
M.state = nil

---@private
---@type boolean?
M.ok = nil

---@private
---@module 'lint'
M.lint = nil

---@return nil
function M.set_state()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr == M.current_bufnr then
    return
  end
  M.current_bufnr = bufnr

  local linters = M.lint._resolve_linter_by_ft(vim.bo.filetype)

  if #linters == 0 then
    M.state = nil
    return
  end

  if vim.o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  M.state = string.format("%%#St_gitIcons# %s ", table.concat(linters, ", "))
end

---@return string?
return function()
  if M.ok then
    M.set_state()
    return M.state
  end

  if M.ok == nil then
    if package.loaded["lint"] == nil then
      return
    else
      M.ok, M.lint = pcall(require, "lint")
    end
  end

  if M.ok == false then
    return
  end

  M.set_state()
  return M.state
end
