---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      css = {
        "prettier",
      },
      less = {
        "prettier",
      },
      scss = {
        "prettier",
      },
    },
  },
  optional = true,
}
