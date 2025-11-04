local api = vim.api
local bo = vim.bo

local M = {}

---@private
---@type string?
M.status = nil

---@private
---@type true?
M.have_setup_autocmd = nil

---@private
---@param variable string
---@return string|nil
local function get_venv_name(variable)
  local venv = os.getenv(variable)
  if not venv or venv == "" then
    return nil
  end
  return venv:match("([^/\\]+)$")
end

---@private
---@param bufnr number
function M.set_status(bufnr)
  local ft = bo[bufnr].filetype
  if ft ~= "python" then
    M.status = nil
    return
  end

  local venv = get_venv_name("CONDA_DEFAULT_ENV") or get_venv_name("VIRTUAL_ENV")
  if not venv then
    M.status = nil
    return
  end
  M.status = string.format("%%#St_gitIcons# %s ", venv)
end

---@private
function M.setup()
  if M.have_setup_autocmd then
    return
  end
  M.have_setup_autocmd = true
  M.set_status(api.nvim_get_current_buf())
  api.nvim_create_autocmd({
    "BufEnter",
  }, {
    callback = function(args)
      M.set_status(args.buf)
    end,
  })
end

---@return string|nil
return function()
  M.setup()
  return M.status
end
