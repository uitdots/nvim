-- TODO: Remove this when neovim lspconfig and mason support this

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  cmd = { "kotlin-ls", "--stdio" },
  single_file_support = true,
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
}
