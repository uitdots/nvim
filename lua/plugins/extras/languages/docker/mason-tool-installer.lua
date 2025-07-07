---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "docker-compose-language-service",
      "dockerfile-language-server",
      "hadolint",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
