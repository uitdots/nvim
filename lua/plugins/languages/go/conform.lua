---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      formattag = {
        command = "formattag",
        args = {
          "-file",
          "$FILENAME",
          "-C",
        },
      },
    },
    formatters_by_ft = {
      go = {
        "formattag",
      },
    },
  },
  optional = true,
}
