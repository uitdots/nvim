---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      zsh = {
        "beautysh",
      },
      sh = {
        "shfmt",
      },
    },
  },
  optional = true,
}
