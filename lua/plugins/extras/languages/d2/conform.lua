---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      d2 = {
        stdin = false,
        args = {
          "fmt",
          "$FILENAME",
        },
      },
    },
    formatters_by_ft = {
      d2 = {
        "d2",
      },
    },
  },
  optional = true,
}
