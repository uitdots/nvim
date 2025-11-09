vim.filetype.add({
  pattern = {
    ["Chart.ya?ml"] = "helm", ---TODO: Until qvalentin/helm-ls.nvim support this
  },
})

---@type LazySpec
return {}
