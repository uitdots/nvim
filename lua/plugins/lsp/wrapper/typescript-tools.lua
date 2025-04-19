---@type NvPluginSpec
return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  ft = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  opts = {
    settings = {
      expose_as_code_action = {
        "fix_all",
        "organize_imports",
      },
      separate_diagnostic_server = true, -- Disable separate diagnostic server
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        preferGoToSourceDefinition = false,
        quotePreference = "auto",
        importModuleSpecifierEnding = "non-relative",
        importModuleSpecifierPreference = "non-relative",
      },
    },
  },
  -- config = nil,
}
