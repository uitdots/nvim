---@type NvPluginSpec
return {
  "Zeioth/garbage-day.nvim",
  config = true,
  specs = {
    {
      "neovim/nvim-lspconfig",
      dependencies = "Zeioth/garbage-day.nvim",
    },
  },
}
