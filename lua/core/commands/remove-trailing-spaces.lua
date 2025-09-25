local command = vim.api.nvim_create_user_command

command("RemoveTrailingSpaces", function()
  vim.cmd(":%s/s+$//e")
end, { desc = "Remove all trailing spaces" })
