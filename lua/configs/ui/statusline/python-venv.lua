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
---@type string?
M.status = nil

function M.set_status()
  local bufnr = vim.api.nvim_get_current_buf()
  if bufnr == M.current_bufnr then
    return
  end
  M.current_bufnr = bufnr

  local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV")
  if venv == nil then
    M.status = nil
    return
  end
  M.status = "%#St_gitIcons#  "
end

---@return string?
return function()
  if vim.bo.filetype ~= "python" then
    return
  end
  M.set_status()
  return M.status
end
