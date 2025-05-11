local root_markers = { "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts" }

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  filetypes = {
    "groovy",
    "kotlin",
  },
  init_options = {
    gradle = {
      nestedProjects = true,
    },
  },
  root_dir = function(_, on_dir)
    local fname = vim.fn.expand("%:t")
    if vim.tbl_contains(root_markers, fname) then
      on_dir(vim.fn.expand("%:h"))
    end
  end,
}
