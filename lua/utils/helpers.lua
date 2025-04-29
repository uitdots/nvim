local M = {}

---Debounce from LazyVim
---https://www.lazyvim.org/plugins/linting#nvim-lint
---@async ya is it async?
---@param fn function
---@param ms number
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

return M
