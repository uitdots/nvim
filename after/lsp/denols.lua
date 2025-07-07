---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  root_markers = {
    "deno.json",
    "deno.jsonc",
  },
  workspace_required = true,
}
