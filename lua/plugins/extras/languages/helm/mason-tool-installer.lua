---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "helm-ls",
      "kube-linter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
