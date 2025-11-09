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
      cs = {
        "clang_format",
      },
    },
  },
  optional = true,
}
