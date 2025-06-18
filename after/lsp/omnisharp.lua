---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  cmd = {
    "dotnet",
    vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll",
  },
  ---@type lspconfig.settings.omnisharp
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
      AnalyzeOpenDocumentsOnly = nil,
    },
  },
}
