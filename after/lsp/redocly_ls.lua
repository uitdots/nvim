---@type vim.lsp.Config
return {
  cmd = { "redocly-ls", "--stdio" },
  filetypes = { "yaml.openapi", "yaml", "json" },
  root_markers = { ".redocly.yaml", ".redocly.yml", "redocly.yaml", "redocly.yml" },
  workspace_required = true,
  name = "redocly_ls",
}
