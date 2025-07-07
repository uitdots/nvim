-- This is not right because we cache it using bufnr

local M = {}

---@private
---@type integer?
M.current_bufnr = nil

M.fileformats = {
  unix = "",
  dos = "",
  mac = "",
}

---@private
---@type string
M.status = nil

function M.set_current_eol()
  M.status = string.format(" %%#St_gitIcons# %s ", M.fileformats[vim.bo.fileformat])
end

return function()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.set_current_eol()
  end

  return M.status
end
