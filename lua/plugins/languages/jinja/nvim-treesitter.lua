---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "jinja",
      "jinja_inline",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
