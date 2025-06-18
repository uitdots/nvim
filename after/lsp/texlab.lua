---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true, -- Enable build on save (autosave trigger)
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "zathura", -- or your preferred PDF viewer
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
