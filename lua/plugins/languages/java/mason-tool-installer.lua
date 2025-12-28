---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ---@type Mason.Package[]
    ensure_installed = {
      "gradle-language-server",
      "java-debug-adapter",
      "java-test",
      "jdtls",
      "junit",
      "vscode-spring-boot-tools",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
