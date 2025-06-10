---@type NvPluginSpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
    opts_extend = {
      "ensure_installed",
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      optional = true,
      opts = {
        ensure_installed = {
          "codelldb",
        },
      },
      opts_extend = {
        "ensure_installed",
      },
    },
  },
}
