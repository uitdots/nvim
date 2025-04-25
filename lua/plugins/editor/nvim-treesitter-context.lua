---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = {
    "TSContextToggle",
  },
  keys = {
    {
      "<leader>oc",
      "<cmd>TSContextToggle<cr>",
      desc = "Options | Toggle TS Context",
      silent = true,
    },
  },
  opts = {
    enable = true,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
  },
}
