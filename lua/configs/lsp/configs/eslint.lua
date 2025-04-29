return {
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
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
  },
}
