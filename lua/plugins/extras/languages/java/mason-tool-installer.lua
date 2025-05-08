---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "jdtls",
      "google-java-format",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
