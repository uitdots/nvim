---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "rust-analyzer",
      "codelldb",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
