-- This is not right because we cache it using bufnr

local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

function M.set_current_eol()
  local eol = vim.bo.fileformat == "unix" and "lf" or vim.bo.fileformat == "dos" and "crlf" or "cr"
  M.status = "| %#St_gitIcons#" .. eol .. " "
end

function M.render()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.set_current_eol()
  end

  return M.status
end

return M.render
