---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "clang-format",
      "clangd",
      "cpptools",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
