---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "tailwindcss-language-server",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
