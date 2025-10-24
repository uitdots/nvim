local get_executable = require("utils.executable")

---@type vim.lsp.Config
return {
  cmd = {
    "dotnet",
    get_executable("OmniSharp.dll", "packages/omnisharp/libexec"),
  },
  ---@module 'codesettings'
  ---@type lsp.omnisharp
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
