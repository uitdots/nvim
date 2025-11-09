---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "gofumpt",
      "golangci-lint",
      "golangci-lint-langserver",
      "gopls",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
