---@param variable string
---@return string?
local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv == nil or string.find(venv, "/") then
    return nil
  end
  local matches = venv:gmatch("([^/]+)")
  return matches[#matches]
end

local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

function M.set_status()
  local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV")
  if venv == nil then
    M.status = ""
    return
  end
  M.status = "%#St_gitIcons# "
end

function M.render()
  if vim.bo.filetype ~= "python" then
    return ""
  end

  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.current_bufnr = bufnr
    M.set_status()
  end

  return M.status
end

return M.render
