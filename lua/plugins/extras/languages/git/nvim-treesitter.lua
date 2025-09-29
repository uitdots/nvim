---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "gitcommit",
      "gitignore",
      "gitattributes",
      "git_config",
      "git_rebase",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
