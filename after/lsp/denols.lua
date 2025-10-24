---@type vim.lsp.Config
return {
  root_markers = {
    "deno.json",
    "deno.jsonc",
  },
  workspace_required = true,
  ---@module 'codesettings'
  ---@type lsp.denols
  settings = nil,
}
