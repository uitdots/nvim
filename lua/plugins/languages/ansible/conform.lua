---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      ansible = {
        "prettier",
        "ansible-lint",
      },
    },
  },
  optional = true,
}
