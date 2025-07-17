---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  cmd = "TSContextToggle",
  keys = {
    {
      "<leader>tc",
      "<cmd>TSContextToggle<cr>",
      desc = "Treesitter | Toggle Context",
      silent = true,
    },
  },
  opts = {
    enable = false,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
  },
}
