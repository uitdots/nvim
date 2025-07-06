vim.filetype.add({
  pattern = {
    [".*/%.env"] = "dotenv",
    [".*/.*%.env"] = "dotenv",
    [".*/%.env%..*"] = "dotenv",
  },
})

---@type NvPluginSpec
return {}
