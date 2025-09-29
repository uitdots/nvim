---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "java",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
