local M = {}

---Debounce from LazyVim
---https://www.lazyvim.org/plugins/linting#nvim-lint
---@generic T : function
---@param fn T
---@param ms number
---@return T
function M.debounce(fn, ms)
  local timer = vim.uv.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

function M.set_timeout(fn, ms)
  vim.defer_fn(fn, ms)
end

---@generic T,U
---@param fn function():T Function that returns actual value
---@param ms integer Delay in milliseconds
---@param default_value U?
---@return function():U|T
function M.delayed_start(fn, ms, default_value)
  local started = false
  local timer = vim.uv.new_timer()

  timer:start(ms, 0, function()
    started = true
    timer:stop()
    timer:close()
  end)

  return function(...)
    if not started then
      return default_value
    end
    return fn(...)
  end
end

-- TODO: Maybe move this to another utils
function M.open_spell_sugestion()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if col <= #line and line:sub(col, col):match("%a") then
    vim.cmd("Telescope spell_suggest")
  end
end

---@generic T
---@param items T[]
---@param predicate fun(items: T):boolean
---@result integer?
function M.index_of(items, predicate)
  for i, item in ipairs(items) do
    if predicate(item) then
      return i
    end
  end
  return nil
end

---@param path string absolute path
---@param opts? {follow_symlink: boolean}
---@return table | nil
function M.get_child_folders(path, opts)
  local follow_symlink = opts and opts.follow_symlink or false
  local folders = {}
  local scan = vim.uv.fs_scandir(path)

  if not scan then
    return
  end

  while true do
    local name, type = vim.uv.fs_scandir_next(scan)
    if not name then
      break
    end

    if type == "directory" then
      local full_path = string.format("%s/%s", path, name)
      local stat = vim.uv.fs_stat(full_path)
      if stat and (follow_symlink or not stat.type == "link") then
        table.insert(folders, full_path)
      end
    end
  end

  return folders
end

return M
