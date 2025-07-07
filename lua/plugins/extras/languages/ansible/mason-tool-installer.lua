---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "ansible-language-server",
      "ansible-lint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
