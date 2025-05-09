---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "kotlin-language-server",
      "ktlint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
