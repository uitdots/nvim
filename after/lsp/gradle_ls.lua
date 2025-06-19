---@diagnostic disable: missing-fields

local root_markers = {
  "build.gradle",
  "build.gradle.kts",
  "settings.gradle",
  "settings.gradle.kts",
}

---@type vim.lsp.Config
return {
  filetypes = {
    "groovy",
    "kotlin",
  },
  root_dir = function(_, on_dir)
    local fname = vim.fn.expand("%:t")
    if vim.tbl_contains(root_markers, fname) then
      on_dir(vim.fn.expand("%:h"))
    end
  end,
}
