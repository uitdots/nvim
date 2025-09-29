---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
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
