---@type LazySpec
return {
  "mason-org/mason-lspconfig.nvim",
  event = {
    "BufReadPre", -- Must load before entering buffer, not post
    "BufNewFile",
  },
  ---@module 'mason-lspconfig'
  ---@type MasonLspconfigSettings
  opts = {
    automatic_enable = {
      exclude = require("preferences").lsp.exclude,
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
  },
}
