---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "html-lsp",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
