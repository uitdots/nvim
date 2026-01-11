---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "json",
      "json5",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
