---@type NvPluginSpec
return {
  "Wansmer/treesj",
  cmd = {
    "TSJToggle",
  },
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
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
  }, -- if you install parsers with "nvim-treesitter"
}
