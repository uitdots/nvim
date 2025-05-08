---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "clang-format",
      "clangd",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
