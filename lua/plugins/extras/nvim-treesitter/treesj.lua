---@type NvPluginSpec
return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  }, -- if you install parsers with "nvim-treesitter"
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
}
