---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    ---Don't add prettier for yaml.helm-values ft here
    formatters_by_ft = {
      helm = {
        "prettier",
      },
      helmchart = {
        "prettier",
      },
    },
  },
  optional = true,
}
