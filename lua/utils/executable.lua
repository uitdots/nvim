local M = {}

---Return the full executable path if exist in Mason path or in $PATH
---@param path string executable file, can be glob
---@param opts? {masons: (string|string[])?, list: boolean?}
---@return string | string[] | nil
function M.get_executable(path, opts)
  opts = opts or {}
  local masons = type(opts.masons) == "string" and { opts.masons } or opts.masons
  ---@cast masons string[]?

  local list = opts.list or false

  if masons then
    for mason in masons do
      local mason_file = vim.fn.glob(string.format("$MASON/%s/%s", mason, path), false, list)
      if mason_file ~= "" or #mason_file ~= 0 then
        return mason_file
      end
    end
  end

  local full_path = vim.fn.globpath(vim.o.runtimepath, path, false, list)
  if full_path ~= "" or #full_path ~= 0 then
    return full_path
  end
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

---@type table<string, boolean>
local executable_cache = {}

---@param executable string
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

---@param prompt string
---@param callback fun(selected_executable: string)
function M.executable_picker(prompt, callback)
  local executables = vim.fn.systemlist({ "fd", "--hidden", "--no-ignore", "--type", "x" })

  if #executables == 0 then
    vim.notify("No executable files found", vim.log.levels.WARN)
    return
  end

  vim.ui.select(executables, {
    prompt = prompt,
  }, function(choice)
    if choice then
      callback(choice)
    end
  end)
end

return M
