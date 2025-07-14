local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string?
M.state = nil

---@type boolean?
M.ok = nil

---@module 'conform'
M.conform = nil

---@return nil
function M.set_state()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr == M.current_bufnr then
    return
  end
  M.current_bufnr = bufnr

  local formatters = M.conform.list_formatters(0)

  if #formatters == 0 then
    M.state = nil
    return
  end

  if vim.o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  ---@param formatter conform.FormatterInfo
  local formatters_names = vim.tbl_map(function(formatter)
    return formatter.name
  end, formatters)
  M.state = string.format("%%#St_gitIcons# %s ", table.concat(formatters_names, ", "))
end

---@return string|nil
return function()
  if M.ok then
    M.set_state()
    return M.state
  end

  if M.ok == nil then
    if package.loaded["conform"] == nil then
      return
    else
      M.ok, M.conform = pcall(require, "conform")
    end
  end

  if M.ok == false then
    return
  end

  M.set_state()
  return M.state
end
