---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",

  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "editorconfig",
      "ssh_config",
      "tmux",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
