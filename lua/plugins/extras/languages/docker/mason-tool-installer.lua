---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
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
  optional = true,
}
