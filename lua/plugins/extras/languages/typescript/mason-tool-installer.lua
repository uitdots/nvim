---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "eslint-lsp",
      "js-debug-adapter",
      "prettier",
      "typescript-language-server",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
