---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
