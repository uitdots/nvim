-- TODO: move this to lang setup
vim.filetype.add({
  extension = {
    ["templ"] = "templ",
    ["json"] = "jsonc",
    ["http"] = "http",
    ["regex"] = "regex",
    ["xaml"] = "xml",
    ["plist"] = "xml",
  },
  pattern = {
    [".*/Jenkinsfile"] = "groovy",
    [".*/%.env"] = "dotenv",
    [".*/.*%.env"] = "dotenv",
    [".*/%.env%..*"] = "dotenv",
    [".*/.*compose%.ya?ml"] = "yaml.docker-compose",
    [".*/.*compose%.override%.ya?ml"] = "yaml.docker-compose",
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})
