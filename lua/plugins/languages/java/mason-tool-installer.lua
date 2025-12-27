---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "checkstyle",
      "java-debug-adapter",
      "jdtls",
      "vscode-spring-boot-tools",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
