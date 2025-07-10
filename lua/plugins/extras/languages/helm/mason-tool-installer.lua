---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "kube-linter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
