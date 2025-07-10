---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "ruff",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
