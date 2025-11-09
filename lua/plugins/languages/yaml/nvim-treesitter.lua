---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "yaml",
    },
    indent = {
      disable = {
        yaml = true, -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1377
      },
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
