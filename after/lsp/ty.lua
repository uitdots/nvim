---@type vim.lsp.Config
return {
  ---@module 'lspconfig'
  settings = {
    environment = {
      ["extra-paths"] = {
        string.format("%s/lazy/typeshed", vim.fn.stdpath("data")),
      },
    },
  },
}
