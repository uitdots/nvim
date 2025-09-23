---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "d2",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  dependencies = "ravsii/tree-sitter-d2",
}
