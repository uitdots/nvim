---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      ruff_fix = {
        append_args = {
          "--select=I",
          -- "--ignore=F401", -- Unused import
        },
      },
    },
    formatters_by_ft = {
      python = {
        "ruff_fix",
        "ruff_format",
        -- "ruff_organize_imports", -- Should be set in config, so that ruff_fix can do that
      },
    },
  },
  optional = true,
}
