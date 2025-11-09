---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      tex = {
        "tex-fmt",
        "latexindent",
        -- "bibtex-tidy",
      },
    },
  },
  optional = true,
}
