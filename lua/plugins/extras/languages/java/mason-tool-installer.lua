---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "java-debug-adapter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
