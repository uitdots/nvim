---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.eslint
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = false,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = false,
    quiet = true,
    run = "onSave",
  },
  ---@diagnostic disable-next-line: missing-fields
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
  },
}
