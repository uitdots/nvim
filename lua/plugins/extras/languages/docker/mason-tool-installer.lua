---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "docker-compose-language-service",
      "docker-language-service",
      "hadolint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
