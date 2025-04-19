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
    vim.b.disable_autoformat = true
    vim.notify("Disable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
  else
    vim.g.disable_autoformat = true
    vim.notify("Disable Autoformat", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Disable Autoformat", bang = true })

command("FormatEnable", function(args)
  if args.bang then
    vim.b.disable_autoformat = false
    vim.notify("Enable Autoformat (Local)", vim.log.levels.INFO, { title = "Format" })
  else
    vim.g.disable_autoformat = false
    vim.notify("Enable Autoformat", vim.log.levels.INFO, { title = "Format" })
  end
end, { desc = "Enable Autoformat", bang = true })

command("FormatToggle", function(args)
  if args.bang then
    if vim.b.disable_autoformat then
      vim.cmd("FormatEnable!")
    else
      vim.cmd("FormatDisable!")
    end
  else
    if vim.g.disable_autoformat then
      vim.cmd("FormatEnable")
    else
      vim.cmd("FormatDisable")
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

command("NvChadMasonInstallAll", function()
  require("nvchad.mason").install_all()
end, { desc = "NvChad Mason Install All" })

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
    for _, reg in ipairs(registers) do
      vim.fn.setreg(reg, "")
    end

    vim.notify("All registers have been cleared")
    return
  end
  for _, reg in ipairs(args.fargs) do
    if vim.fn.getreg(reg) ~= nil then
      vim.fn.setreg(reg, "")
      print("Cleared register: " .. reg)
    else
      print("Invalid register: " .. reg)
    end
  end
end, { desc = "Clear register data", nargs = "*" })
