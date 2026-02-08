vim.filetype.add({
  filename = {
    ["atlas.hcl"] = "atlas-config",
  },
  pattern = {
    [".*/*.my.hcl"] = "atlas-schema-mysql",
    [".*/*.pg.hcl"] = "atlas-schema-postgresql",
    [".*/*.lt.hcl"] = "atlas-schema-sqlite",
    [".*/*.ch.hcl"] = "atlas-schema-clickhouse",
    [".*/*.ms.hcl"] = "atlas-schema-mssql",
    [".*/*.rs.hcl"] = "atlas-schema-redshift",
    [".*/*.test.hcl"] = "atlas-test",
    [".*/*.plan.hcl"] = "atlas-plan",
    [".*/*.rule.hcl"] = "atlas-rule",
  },
})

local register = vim.treesitter.language.register

register("hcl", "atlas-config")
register("hcl", "atlas-schema-mysql")
register("hcl", "atlas-schema-postgresql")
register("hcl", "atlas-schema-sqlite")
register("hcl", "atlas-schema-clickhouse")
register("hcl", "atlas-schema-mssql")
register("hcl", "atlas-schema-redshift")
register("hcl", "atlas-test")
register("hcl", "atlas-plan")
register("hcl", "atlas-rule")

---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "atlas",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
