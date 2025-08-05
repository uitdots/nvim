---TODO: remove this plugin when typescript go is done!!!!!

local lsp = require("configs.lsp")
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  cond = is_executable("typescript-language-server"),
  ft = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  opts = {
    capabilities = lsp.capabilities,
    on_init = lsp.on_init,
    settings = {
      expose_as_code_action = "all", ---@type "fix_all" | "add_missing_imports" | "remove_unused" | "remove_unused_imports" | "organize_imports" | "all"
      separate_diagnostic_server = true,
      -- ref: https://github.com/mdk194/nvim/blob/main/lua/plugins/typescript-tools.lua
      tsserver_file_preferences = {
        allowRenameOfImportPath = true,
        includeAutomaticOptionalChainCompletions = true,
        provideRefactorNotApplicableReason = true,
        allowIncompleteCompletions = true,
        displayPartsForJSDoc = true,
        disableLineTextInReferences = true,
        includeInlayParameterNameHints = "all", ---@type 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = "non-relative", ---@type "shortest" | "project-relative" | "relative" | "non-relative"
      },
    },
  },
}
