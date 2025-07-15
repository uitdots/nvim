local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string?
M.state = nil

---@private
---@return nil
function M.set_status()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr == M.current_bufnr then
    return
  end
  M.current_bufnr = bufnr

  local lsps = vim.lsp.get_clients({ bufnr = bufnr })

  if #lsps == 0 then
    M.state = nil
    return
  end

  if vim.o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  ---@param client vim.lsp.Client
  local clients = vim.tbl_map(function(client)
    return client.name
  end, lsps)

  M.state = string.format("%%#St_gitIcons# %s ", table.concat(clients, ", "))
end

---@return string?
return function()
  M.set_status()
  return M.state
end
