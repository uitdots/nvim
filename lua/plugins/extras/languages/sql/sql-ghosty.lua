---@type NvPluginSpec
return {
  "pmouraguedes/sql-ghosty.nvim",
  cmd = {
    "SqlInlayHintsToggle",
  },
  opts = {
    show_hints_by_default = require("uitvim").options.lsp_inlayhint_enabled,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
