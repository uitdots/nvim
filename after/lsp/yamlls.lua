---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.gitlab",
    "yaml.github",
  },
  ---@type lspconfig.settings.yamlls
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas({
        extra = {
          {
            description = "Docker compose for yaml.docker-compose",
            fileMatch = {
              "**/*compose.override.yaml",
              "**/*compose.override.yml",
              "**/*compose.yaml",
              "**/*compose.yml",
            },
            name = "docker-compose.yml",
            url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
          },
        },
      }),
    },
  },
}
