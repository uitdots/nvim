---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "js-debug-adapter",
      "prettier",
      "typescript-language-server",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
