---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "yaml",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
