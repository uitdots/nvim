---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "nginx-config-formatter",
      "nginx-language-server",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
