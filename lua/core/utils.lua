local M = {}

---Return the full path of the executable
---@param executable string executable file
---@return string | nil
function M.get_path_from_executable(executable)
  local path = vim.fn.fnamemodify(vim.fn.exepath(executable), ":h")
  return path == "." and nil or path
end

function M.open_spell_sugestion()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if col <= #line and line:sub(col, col):match("%a") then
    vim.cmd("Telescope spell_suggest")
  end
end

---Return the executable path if exist in $PATH, fallback to mason package
---@param path string executable file
---@param mason? { package: string, inner_path?: string } mason package
---@param opts? { full_path?: boolean }
---@return string | nil
function M.get_executable(path, mason, opts)
  local full_path = vim.fn.exepath(path)
  if full_path ~= "" then
    return opts ~= nil and opts.full_path == true and full_path or path
  end
  if mason == nil then
    return nil
  end
  local mason_root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  local ret = mason_root .. "/packages/" .. mason.package .. "/" .. mason.inner_path ~= nil and (mason.inner_path .. "/")
    or "" .. path
  if not vim.loop.fs_stat(ret) then
    vim.notify("Exetable not found: " .. mason.package, vim.log.levels.WARN)
    return
  end
  return ret
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

---Debounce from LazyVim
---https://www.lazyvim.org/plugins/linting#nvim-lint
---@param ms number
---@param fn function
function M.debounce(ms, fn)
  local timer = vim.uv.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

return M
