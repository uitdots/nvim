---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  ---NOTE: Use language server it has linter already

  -- opts = function()
  -- local lint = require("lint")
  --
  -- lint.linters_by_ft.ansible = {
  --   "ansible_lint",
  -- }
  -- end,
  optional = true,
}
