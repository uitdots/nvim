-- This is not right because we cache it using bufnr

local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
M.fileformats = {
  unix = "",
  dos = "",
  mac = "",
}

---@private
---@type string
M.state = nil

---@return string?
return function()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.state = string.format("%%#St_gitIcons#%s  ", M.fileformats[vim.bo.fileformat])
  end

  return M.state
end
