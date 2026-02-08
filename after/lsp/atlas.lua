---@type vim.lsp.Config
return {
  -- HACK: Idk the default atlas-* doesn't work on my neovim?
  filetypes = {
    "atlas-config",
    "atlas-schema-mysql",
    "atlas-schema-postgresql",
    "atlas-schema-sqlite",
    "atlas-schema-clickhouse",
    "atlas-schema-mssql",
    "atlas-schema-redshift",
    "atlas-test",
    "atlas-plan",
    "atlas-rule",
  },
}
