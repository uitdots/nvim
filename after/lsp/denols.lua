-- TODO: cleanup this, or make it work. Found upward for root markers idk how to set it up

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  -- root_dir = function(bufnr, on_dir)
  --   local fname = vim.api.nvim_buf_get_name(bufnr)
  --   on_dir(vim.fs.dirname(vim.fs.find("deno.json", { path = fname, upward = true })[1]))
  -- end,
  root_markers = {
    "deno.json",
    "deno.jsonc",
  },
  workspace_required = true,
}
