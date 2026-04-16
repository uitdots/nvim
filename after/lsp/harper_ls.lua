---@type vim.lsp.Config
return {
  settings = {
    ["harper-ls"] = {
      dialect = "British",
      linters = {
        ToDoHyphen = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 2000,
  },
}
