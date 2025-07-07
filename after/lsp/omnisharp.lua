---@diagnostic disable: missing-fields
---@module 'neoconf'

local get_executable = require("utils.executable")

---@type vim.lsp.Config
return {
  cmd = {
    "dotnet",
    get_executable("OmniSharp.dll", "packages/omnisharp/libexec"),
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
