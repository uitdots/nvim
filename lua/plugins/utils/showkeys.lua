---@type NvPluginSpec
return {
  "nvzone/showkeys",
  dependencies = { "nvzone/volt" },
  cmd = "ShowkeysToggle",
  -- FIXME: Keymaps later
  init = function()
    vim.keymap.set("n", "<leader>ok", "<cmd>ShowkeysToggle<cr>", { desc = "Showkeys | Toggle", silent = true })
  end,
}
