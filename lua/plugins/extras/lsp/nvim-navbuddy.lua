---@type NvPluginSpec
return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "Navbuddy",
  },
  keys = {
    {
      "<leader>ln",
      "<cmd>Navbuddy<cr>",
      desc = "LSP | Open Navbuddy",
      silent = true,
    },
  },
  opts = {
    lsp = {
      auto_attach = true,
    },
  },
}
