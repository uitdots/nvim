---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      json = {
        "prettier",
      },
      jsonc = {
        "prettier",
      },
    },
  },
  optional = true,
}
