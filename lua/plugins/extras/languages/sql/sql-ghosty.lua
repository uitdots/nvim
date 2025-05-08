---@type NvPluginSpec
return {
  "pmouraguedes/sql-ghosty.nvim",
  cmd = {
    "SqlInlayHintsToggle",
  },
  opts = {
    show_hints_by_default = true,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
