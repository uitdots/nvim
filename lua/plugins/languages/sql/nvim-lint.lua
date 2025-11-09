---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    lint.linters.pgsqlfluff = vim.tbl_deep_extend(
      "force",
      ---@diagnostic disable-next-line: param-type-mismatch
      lint.linters.sqlfluff,
      {
        args = {
          "lint",
          "--format=json",
          "--dialect=postgres",
        },
      }
    )

    lint.linters_by_ft.pgsql = {
      "pgsqlfluff",
    }
  end,
  optional = true,
}
