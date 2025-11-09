---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
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
