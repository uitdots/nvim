---@diagnostic disable: missing-fields

local allow_filenames = {
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
    if vim.tbl_contains(allow_filenames, fname) then
      on_dir()
    end
  end,
}
