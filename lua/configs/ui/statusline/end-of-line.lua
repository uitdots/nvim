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
M.status = ""

function M.set_current_eol()
  M.status = "%#St_gitIcons#" .. M.fileformats[vim.bo.fileformat] .. " "
end

function M.render()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.set_current_eol()
  end

  return M.status
end

return M.render
