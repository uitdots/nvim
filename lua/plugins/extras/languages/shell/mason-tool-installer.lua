---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "beautysh",
      "shfmt",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
