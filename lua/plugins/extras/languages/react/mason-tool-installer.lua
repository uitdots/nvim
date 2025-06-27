---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "chrome-debug-adapter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
