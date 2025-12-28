vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "pom.xml", "build.gradle", "build.gradle.kts" },
  callback = function()
    vim.notify("Gradle/Maven file changed. Consider reloading the project.", vim.log.levels.INFO, {
      title = "Java Project Update",
    })
  end,
})

---@type LazySpec
return {}
