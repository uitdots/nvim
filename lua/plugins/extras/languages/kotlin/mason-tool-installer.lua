---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "kotlin-language-server",
      "ktlint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
