---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "texlab",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
