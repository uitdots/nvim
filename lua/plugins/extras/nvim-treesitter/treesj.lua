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
      "<leader>ut",
      "<cmd>TSJToggle<cr>",
      desc = "Utils | Toggle TreeSJ",
      silent = true,
    },
  },
  config = true,
}
