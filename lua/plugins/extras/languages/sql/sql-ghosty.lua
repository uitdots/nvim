local inlay_hint = require("uitvim").options.inlay_hint

---@type NvPluginSpec
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
