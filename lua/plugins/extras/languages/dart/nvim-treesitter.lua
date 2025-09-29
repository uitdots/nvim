---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "dart",
    },
    indent = {
      disable = {
        dart = true, -- dart delay: https://github.com/NvChad/NvChad/issues/2237#issuecomment-1653019941
      },
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
