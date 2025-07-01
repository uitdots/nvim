---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "groovy-language-server",
      "npm-groovy-lint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
