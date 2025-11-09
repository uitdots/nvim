---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",

  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "c_sharp",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
