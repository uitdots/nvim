---@type LazySpec
return {
  "Wansmer/treesj",
  cmd = "TSJToggle",
  keys = {
    {
      "<leader>ts",
      "<cmd>TSJToggle<cr>",
      desc = "Treesitter | Toggle Split",
      silent = true,
    },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 300,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
  },
}
