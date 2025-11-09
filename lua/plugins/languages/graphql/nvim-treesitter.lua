---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "grapql",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
