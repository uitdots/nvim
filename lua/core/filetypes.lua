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
    [".*/Chart.ya?ml"] = "helmchart", -- Custom type because helm vim cannot set it
    [".*/values.ya?ml"] = "yaml.helm-values", -- Custom type because helm vim cannot set it
    [".*/Jenkinsfile"] = "jenkins",
    [".*/%.env"] = "dotenv",
    [".*/.*%.env"] = "dotenv",
    [".*/%.env%..*"] = "dotenv",
    [".*/.*compose%.ya?ml"] = "yaml.docker-compose",
    [".*/.*compose%.override%.ya?ml"] = "yaml.docker-compose",
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})
