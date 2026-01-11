---@type vim.lsp.Config
return {
  cmd = { "redocly-ls", "--stdio" },
  filetypes = { "yaml.openapi" },
  root_markers = { ".redocly.yaml", ".redocly.yml", "redocly.yaml", "redocly.yml" },
  name = "redocly_ls",
}
