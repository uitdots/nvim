local command = vim.api.nvim_create_user_command

command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
  vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
end, { nargs = "*", desc = "Code Format", range = true })

command("FormatDisable", function(args)
  if args.bang then
    vim.g.autoformat_enabled = false
    vim.notify("Autoformat Disabled", vim.log.levels.INFO, { title = "Format" })
  else
    vim.b.autoformat_enabled = false
    vim.notify("Autoformat Disabled (Local)", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Disable Autoformat", bang = true })

command("FormatEnable", function(args)
  if args.bang then
    vim.g.autoformat_enabled = true
    vim.notify("Autoformat Enabled", vim.log.levels.INFO, { title = "Format" })
  else
    vim.b.autoformat_enabled = true
    vim.notify("Autoformat Enabled (Local)", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Enable Autoformat", bang = true })

command("FormatToggle", function(args)
  if args.bang then
    if vim.b.autoformat_enabled then
      vim.cmd("FormatDisable!")
    else
      vim.cmd("FormatEnable!")
    end
  else
    if vim.g.autoformat_enabled then
      vim.cmd("FormatDisable")
    else
      vim.cmd("FormatEnable")
    end
  end
end, { desc = "Toggle Autoformat", bang = true })

command("RemoveTrailingSpaces", function()
  vim.cmd(":%s/s+$//e")
end, { desc = "Remove all trailing spaces" })

command("AppendToEnd", function(args)
  local prefix = args.line1 .. "," .. args.line2
  local chars = args.fargs[1] ~= nil and args.fargs[1] or ";"
  vim.cmd(prefix .. "g/./normal A" .. chars)
  vim.cmd("nohlsearch")
end, { nargs = "?", desc = 'Append char(s) to end of each line (Default: ";")', range = true })

command("JoinEmptyLines", function(args)
  -- We need silent! because if no match pattern, it will notify error
  if args.fargs[1] ~= nil then
    vim.cmd("silent! g/^$/,/./-" .. args.fargs[1] .. "j") -- Max "n" empty line(s)
  elseif args.bang then
    vim.cmd("silent! g/^$/-j") -- No empty line
  else
    vim.cmd("silent! g/^$/,/./-1j") -- Join max 1 empty line
  end
  vim.cmd([[%s/\_s*\%$//e]]) -- remove the last empty lines
  vim.cmd("nohlsearch")
end, { desc = "Join empty lines", bang = true, nargs = "?" })

-- FIXME: The number registers aren't cleared?
command("ClearRegister", function(args)
  if #args.fargs == 0 then
    local registers = {
      '"',
      "-",
      "/",
      "*",
      "+",
      "=",
      "_",
      unpack(vim.fn.range(0, 9)), -- Registers 0-9
      unpack(vim.fn.map(vim.fn.range(97, 122), function(_, v)
        return string.char(v)
      end)), -- a-z
    }
    -- Clear each register
    for _, reg in pairs(registers) do
      vim.fn.setreg(reg, "")
    end

    vim.notify("All registers have been cleared")
    return
  end
  for _, reg in pairs(args.fargs) do
    if vim.fn.getreg(reg) ~= nil then
      vim.fn.setreg(reg, "")
      print("Cleared register: " .. reg)
    else
      print("Invalid register: " .. reg)
    end
  end
end, { desc = "Clear register data", nargs = "*" })
