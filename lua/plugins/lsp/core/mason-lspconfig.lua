---@type NvPluginSpec
return {
  "mason-org/mason-lspconfig.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  ---@module 'mason-lspconfig'
  ---@type MasonLspconfigSettings
  opts = {
    automatic_enable = {
      exclude = require("uitvim").no_setup_lsps,
    },
  },
}
