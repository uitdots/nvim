---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "terraform", -- Formatter, Linter, Runtime
      "terraform-ls", -- Used for LSP
      "trivy", -- Because tfsec is part of trivy now
      -- "tflint", -- This is linter as lsp, but... maybe tfsec aka trivy is better
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
