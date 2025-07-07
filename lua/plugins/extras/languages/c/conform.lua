---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      clang_format = {
        append_args = {
          "--fallback-style=Microsoft",
        },
      },
    },
    formatters_by_ft = {
      c = {
        "clang_format",
      },
      cpp = {
        "clang_format",
      },
    },
  },
  optional = true,
}
