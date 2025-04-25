local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

function M.set_status()
  local lint = require("lint")
  local linters = lint._resolve_linter_by_ft(vim.bo.filetype)
  if #linters == 0 then
    M.status = ""
    return
  end

  if vim.o.columns < 100 then
    M.status = " %#St_gitIcons#  "
    return
  end

  M.status = " %#St_gitIcons# " .. table.concat(linters, ", ") .. " "
end

function M.render()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.current_bufnr = bufnr
    M.set_status()
  end
  return M.status
end

return M.render
