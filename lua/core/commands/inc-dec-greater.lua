---@param target number
---@param step number
---@param range? {start_line: number, end_line: number}
local function transform_numbers(target, step, range)
  local bufnr = vim.api.nvim_get_current_buf()
  local start_line, end_line

  if range then
    start_line, end_line = range.start_line, range.end_line
  else
    start_line, end_line = 0, -1
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line, false)

  for i, line in ipairs(lines) do
    lines[i] = line:gsub("%d+", function(num)
      local n = tonumber(num)
      if n > target then
        return tostring(n + step)
      end
      return num
    end)
  end

  vim.api.nvim_buf_set_lines(bufnr, start_line, end_line, false, lines)
end

local function command_factory(step_sign)
  return function(opts) ---@param opts vim.api.keyset.create_user_command.command_args
    local target = tonumber(opts.fargs[1]) ---@cast target number
    local step = tonumber(opts.fargs[2]) or 1
    step = step * step_sign

    if opts.range == 0 then
      transform_numbers(target, step, nil)
    else
      transform_numbers(target, step, {
        start_line = opts.line1 - 1,
        end_line = opts.line2,
      })
    end
  end
end

-- Expose commands
vim.api.nvim_create_user_command("IncGreater", command_factory(1), { nargs = "+", range = true })
vim.api.nvim_create_user_command("DecGreater", command_factory(-1), { nargs = "+", range = true })
