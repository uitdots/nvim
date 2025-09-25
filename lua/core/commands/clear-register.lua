local command = vim.api.nvim_create_user_command

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
