---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "powershell-editor-services",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
