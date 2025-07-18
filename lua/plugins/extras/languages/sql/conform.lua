---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@param opts? conform.setupOpts
  ---@return conform.setupOpts
  opts = function(_, opts)
    opts = opts or {}
    opts.formatters = opts.formatters or {}
    opts.formatters.pg_sqlfluff = vim.tbl_extend("force", require("conform.formatters.sqlfluff"), {
      append_args = {
        "--dialect=postgres",
      },
    })

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.postgresql = {
      "pg_sqlfluff",
    }
    return opts
  end,
  optional = true,
}
