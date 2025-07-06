vim.filetype.add({
  pattern = {
    [".*/Code.*/User/settings.json"] = "jsonc",
    ["komorebi.json"] = "jsonc",
  },
})

---@type NvPluginSpec
return {}
