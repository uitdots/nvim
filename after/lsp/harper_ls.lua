---@type vim.lsp.Config
return {
  settings = {
    ["harper-ls"] = {
      dialect = "British",
    },
  },
  flags = {
    debounce_text_changes = 2000,
  },
}
