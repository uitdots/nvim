local M = {}

---Return the executable path if exist in $PATH, fallback to mason package
---@param path string executable file, can be glob
---@param mason string? the glob pattern to the file from $MASON you need
---@return string | nil
function M.get_executable(path, mason)
  ---@type string
  local full_path = vim.fn.globpath(vim.o.runtimepath, path, false, false)
  if full_path ~= "" then
    return full_path
  end
  if mason == nil then
    return nil
  end
  local mason_file = vim.fn.glob(string.format("$MASON/%s/%s", mason, path))
  return mason_file ~= "" and mason_file or nil
end

---Return the full path of the executable
---@param executable string executable file
---@return string | nil
function M.get_path_from_executable(executable)
  local path = vim.fn.fnamemodify(vim.fn.exepath(executable), ":h")
  return path == "." and nil or path
end

---Check if executable exist in PATH or Mason
---@param executable string?
---@return boolean
function M.is_executable(executable)
  if executable == nil or executable == "" then
    return false
  end
  return vim.fn.executable(executable) == 1
end

local executable_cache = {} ---@type table<(string), boolean>

function M.is_executable_cache(executable)
  ---@type boolean | nil
  local is_executable = executable_cache[executable]
  if is_executable ~= nil then
    return is_executable
  end
  is_executable = M.is_executable(executable)
  executable_cache[executable] = is_executable
  return is_executable
end

return M
