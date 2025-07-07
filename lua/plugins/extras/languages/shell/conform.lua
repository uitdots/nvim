---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      beautysh = {
        append_args = {
          "--indent-size=2",
        },
      },
    },
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
