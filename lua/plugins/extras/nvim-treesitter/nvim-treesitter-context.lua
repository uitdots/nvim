---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
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
    enable = false,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
  },
}
