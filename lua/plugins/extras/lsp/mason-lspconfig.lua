---@type LazySpec
return {
  "mason-org/mason-lspconfig.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
  ---@module 'mason-lspconfig'
  ---@type MasonLspconfigSettings
  opts = {
    automatic_enable = {
      exclude = require("uitvim").lsp.exclude,
    },
  },
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      optional = true,
    },
    {
      "mason-org/mason.nvim",
      optional = true,
    },
  },
}
