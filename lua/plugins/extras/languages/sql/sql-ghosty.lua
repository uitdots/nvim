local inlay_hint = require("preferences").options.inlay_hint

---@type LazySpec
return {
  "pmouraguedes/sql-ghosty.nvim",
  cmd = {
    "SqlInlayHintsToggle",
  },
  opts = {
    show_hints_by_default = inlay_hint.servers == true or (inlay_hint.servers.sql ~= nil and inlay_hint.servers.sql) or inlay_hint.server_default,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
