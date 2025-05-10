local root_markers = { "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts" }

---@type vim.lsp.ClientConfig
---@diagnostic disable-next-line: missing-fields
return {
  filetypes = {
    "groovy",
    "kotlin",
  },
  root_markers = root_markers,
  workspace_required = true,
  init_options = {
    gradle = {
      nestedProjects = true,
    },
  },
  -- HACK: When neovim has ability to detect if other fts, then no need this ;v
  on_attach = function(client, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if not vim.tbl_contains(root_markers, filename) then
      vim.lsp.stop_client(client)
      return
    end
    require("configs.lsp.lspconfig").on_attach(client, bufnr)
  end,
}
