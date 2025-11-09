vim.filetype.add({
  pattern = {
    [".*Jenkinsfile.*"] = "jenkins",
  },
})

---@type LazySpec
return {}
