---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "bash",
      "zsh",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
