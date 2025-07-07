vim.filetype.add({
  pattern = {
    [".*/.*compose%.ya?ml"] = "yaml.docker-compose",
    [".*/.*compose%.override%.ya?ml"] = "yaml.docker-compose",
  },
})

---@type LazySpec
return {}
