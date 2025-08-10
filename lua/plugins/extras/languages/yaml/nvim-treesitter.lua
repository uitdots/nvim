---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "yaml",
    },
    indent = {
      disable = {
        "yaml", -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1377
      },
    },
  },
  opts_extend = {
    "ensure_installed",
    "indent.disable",
  },
}
