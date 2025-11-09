---@type LazySpec
return {
  "lifepillar/pgsql.vim",
  lazy = false,
  init = function()
    vim.g.sql_type_default = "pgsql"
  end,
}
