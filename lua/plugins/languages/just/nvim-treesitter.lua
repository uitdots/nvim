---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "just",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
