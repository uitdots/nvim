---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "dockerfile",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
