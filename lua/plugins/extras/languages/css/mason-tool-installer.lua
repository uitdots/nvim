---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "css-lsp",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
