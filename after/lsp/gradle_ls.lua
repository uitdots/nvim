---@type vim.lsp.ClientConfig
---@diagnostic disable-next-line: missing-fields
return {
  filetypes = {
    "groovy",
    "kotlin",
  },
  root_markers = {
    "build.gradle",
    "build.gradle.kts",
    "settings.gradle",
    "settings.gradle.kts",
  },
  workspace_required = true,
  init_options = {
    gradle = {
      nestedProjects = true,
    },
  },
}
