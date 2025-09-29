---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "html",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
