---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "gh-actions-language-server",
      "actionlint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
