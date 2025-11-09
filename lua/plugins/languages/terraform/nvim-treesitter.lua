---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "terraform",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
