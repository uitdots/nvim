---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "jdtls",
      "java-debug-adapter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
