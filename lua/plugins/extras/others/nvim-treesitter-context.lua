---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  cmd = "TSContext",
  keys = {
    {
      "<leader>tc",
      "<cmd>TSContext toggle<cr>",
      desc = "Treesitter | Toggle Context",
      silent = true,
    },
  },
  opts = {
    enable = false,
  },
  main = "treesitter-context",
  dependencies = "nvim-treesitter/nvim-treesitter",
}
