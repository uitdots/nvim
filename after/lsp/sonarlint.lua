---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  cmd = {
    "sonarlint-language-server",
    "-stdio",
  },
  filetypes = {
    "azureresourcemanager",
    "c",
    "cloudformation",
    "cpp",
    "cs",
    "css",
    "docker",
    "go",
    "html",
    "ipython",
    "java",
    "javascript",
    "javascriptreact",
    "kubernetes",
    "php",
    "python",
    "terraform",
    "text",
    "typescript",
    "typescriptreact",
    "xml",
    "yaml",
  },
}
