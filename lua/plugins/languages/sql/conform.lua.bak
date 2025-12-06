---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@param opts? conform.setupOpts
  ---@return conform.setupOpts
  opts = function(_, opts)
    opts = opts or {}
    opts.formatters = opts.formatters or {}
    opts.formatters.pgsqlfluff = vim.tbl_extend("force", require("conform.formatters.sqlfluff"), {
      args = {
        "fix",
        "--dialect=postgres",
        "$FILENAME",
      },
      stdin = false,
    })

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.pgsql = {
      "pgsqlfluff",
    }
    return opts
  end,
  optional = true,
}
