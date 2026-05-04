---@type vim.lsp.Config
return {
  root_markers = {
    "deno.json",
    "deno.jsonc",
  },
  workspace_required = true,
  ---@module 'lspconfig'
  ---@type lspconfig.settings.denols
  settings = nil,
}
