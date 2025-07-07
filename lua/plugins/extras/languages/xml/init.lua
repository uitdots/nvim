vim.filetype.add({
  pattern = {
    ["xaml"] = "xml",
    ["plist"] = "xml", -- TODO: Actually only apple dev need this?
  },
})

---@type LazySpec
return {}
