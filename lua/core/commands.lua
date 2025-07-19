local command = vim.api.nvim_create_user_command

command("RemoveTrailingSpaces", function()
  vim.cmd(":%s/s+$//e")
end, { desc = "Remove all trailing spaces" })

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
