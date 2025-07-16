local ide_mode = require("utils.os").ide_mode

---@type LazySpec
return {
  "mason-org/mason-lspconfig.nvim",
  cond = ide_mode,
  event = {
    "BufRead",
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
