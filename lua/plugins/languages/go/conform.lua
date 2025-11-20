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
        },
        stdin = false,
      },
    },
    formatters_by_ft = {
      go = {
        "formattag",
        lsp_format = "last",
      },
    },
  },
  optional = true,
}
