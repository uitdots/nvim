---@type NvPluginSpec
return {
  {
    "folke/neoconf.nvim",
    opts = {
      live_reload = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    dependencies = {
      "folke/neoconf.nvim",
      optional = true,
    },
  },
}
