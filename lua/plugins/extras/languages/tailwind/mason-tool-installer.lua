---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "tailwindcss-language-server",
      "prettier",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
