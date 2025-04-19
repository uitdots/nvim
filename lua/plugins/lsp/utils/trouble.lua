---@type NvPluginSpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>lt",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "lSP | Buffer Diagnostics",
      silent = true,
    },
    {
      "<leader>lT",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "LSP | Workspace Diagnostics",
      silent = true,
    },
  },
  opts = {
    focus = true, -- Focus the window when opened
  },
}
