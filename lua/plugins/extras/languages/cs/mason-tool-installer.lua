---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "roslyn",
      "rzls",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
