---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "jdtls",
      "java-debug-adapter",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
