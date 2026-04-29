local allowed_filenames = {
  ["nx.json"] = true,
  ["package.json"] = true,
  ["project.json"] = true,
  ["workspace.json"] = true,
}

---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local full_path = vim.api.nvim_buf_get_name(bufnr)
    local filename = vim.fs.basename(full_path)
    if allowed_filenames[filename] then
      on_dir()
    end
  end,
}
