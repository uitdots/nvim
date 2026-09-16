local nvim_get_current_buf = vim.api.nvim_get_current_buf

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
M.state = ""

---@return string?
return function()
  local bufnr = nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.current_bufnr = bufnr
    local format = M.fileformats[vim.bo.fileformat] or nil
    if format == nil then
      M.state = ""
    else
      M.state = string.format("%%#St_gitIcons#%s  ", format)
    end
  end

  return M.state
end
