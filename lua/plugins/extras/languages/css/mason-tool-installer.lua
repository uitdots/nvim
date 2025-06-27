---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "css-lsp",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
