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
      exclude = UitVim.config.no_setup_lsps,
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
