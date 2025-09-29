---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "toml",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
