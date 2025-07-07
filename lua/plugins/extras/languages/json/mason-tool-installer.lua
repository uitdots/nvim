---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "json-lsp",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
