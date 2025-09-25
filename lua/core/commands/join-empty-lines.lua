local command = vim.api.nvim_create_user_command

command("JoinEmptyLines", function(args)
  -- We need silent! because if no match pattern, it will notify error
  if args.fargs[1] ~= nil then
    vim.cmd("silent! g/^$/,/./-" .. args.fargs[1] .. "j") -- Max "n" empty line(s)
  elseif args.bang then
    vim.cmd("silent! g/^$/-j") -- No empty line
  else
    vim.cmd("silent! g/^$/,/./-1j") -- Join max 1 empty line
  end
  vim.cmd([[ %s/\_s*\%$//e ]]) -- remove the last empty lines
  vim.cmd("nohlsearch")
end, { desc = "Join empty lines", bang = true, nargs = "?" })
