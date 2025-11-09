local lsp_utils = require("utils.lsp")

---@type LazySpec
return {
  "pmouraguedes/sql-ghosty.nvim",
  cmd = "SqlInlayHintsToggle",
  opts = {
    show_hints_by_default = lsp_utils.is_inlay_hint_enabled("sql"),
  },
  dependencies = "nvim-treesitter/nvim-treesitter",
}
