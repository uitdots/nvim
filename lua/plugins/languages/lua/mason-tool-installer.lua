---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "lua-language-server@3.16.4",
      "stylua",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
