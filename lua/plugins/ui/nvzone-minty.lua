---@type NvPluginSpec
return {
  "nvzone/minty",
  dependencies = { "nvzone/volt" },
  cmd = { "Shades", "Huefy" },
  -- FIXME: Keymaps later
  init = function()
    vim.keymap.set("n", "<leader>uh", "<cmd>Huefy<cr>", { desc = "Minty | Huefy", silent = true })
    vim.keymap.set("n", "<leader>us", "<cmd>Shades<cr>", { desc = "Minty | Shades", silent = true })
  end,
}
