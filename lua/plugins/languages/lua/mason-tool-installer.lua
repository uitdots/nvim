---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "lua-language-server",
      "stylua",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
