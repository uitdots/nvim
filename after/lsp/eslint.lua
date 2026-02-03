---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.eslint
  settings = {
    eslint = {
      autoFixOnSave = true,
      format = {
        enable = false,
      },
      quiet = true,
      run = "onSave",
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine",
        },
        showDocumentation = {
          enable = false,
        },
      },
      codeActionsOnSave = {
        enable = true,
        mode = "all",
      },
    },
  },
  ---@diagnostic disable-next-line: missing-fields
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
  },
}
