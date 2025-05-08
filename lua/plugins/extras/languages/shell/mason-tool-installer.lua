---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "bash-language-server",
      "beautysh",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
