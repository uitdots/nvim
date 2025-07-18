---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "dart",
    },
    indent = {
      disable = {
        "dart", -- dart delay: https://github.com/NvChad/NvChad/issues/2237#issuecomment-1653019941
      },
    },
  },
  opts_extend = {
    "ensure_installed",
    "indent.disable",
  },
}
