---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    if fname:match(".*compose.*%.ya?ml") then
      return
    end
    local parent = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if vim.endswith(parent, "/.github/workflows") or vim.endswith(parent, "/.forgejo/workflows") or vim.endswith(parent, "/.gitea/workflows") then
      return
    end
    on_dir()
  end,
  ---@module 'codesettings'
  ---@type lsp.yamlls
  settings = {
    yaml = {
      customTags = {
        "!reference sequence",
      },
    },
  },
}
