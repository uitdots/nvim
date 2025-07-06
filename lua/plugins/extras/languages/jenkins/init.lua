vim.filetype.add({
  pattern = {
    [".*Jenkinsfile.*"] = "jenkins",
  },
})

---@type NvPluginSpec
return {}
