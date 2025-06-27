---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "gh-actions-language-server",
      "actionlint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
