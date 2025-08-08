---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "tex-fmt",
      "latexindent",
      -- "bibtex-tidy",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
