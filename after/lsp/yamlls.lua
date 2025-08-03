---@diagnostic disable: missing-fields
---@module 'neoconf'

---@type vim.lsp.Config
return {
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
              "*compose.override.yaml",
              "*compose.override.yml",
              "*compose.yaml",
              "*compose.yml",
            },
            name = "docker-compose.yml",
            url = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
          },
          -- kubernetes
          {
            fileMatch = "",
            name = "kubernetes",
            url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/deployment.json",
          },
          -- argocd, and yaml_ls cannot parse them bruh
          -- {
          --   fileMatch = "",
          --   name = "argo workflows",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-workflows/main/api/jsonschema/schema.json",
          -- },
          -- {
          --   fileMatch = "app-of-apps/apps/*.yaml",
          --   name = "argocd kustomize",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/refs/heads/main/schema/argo_cd_kustomize_schema.json",
          -- },
          -- {
          --   fileMatch = "",
          --   name = "argocd all k8s kustomize",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/refs/heads/main/schema/argo_all_k8s_kustomize_schema.json",
          -- },
          -- {
          --   fileMatch = "",
          --   name = "argocd events kustomize",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/refs/heads/main/schema/argo_events_kustomize_schema.json",
          -- },
          -- {
          --   fileMatch = "",
          --   name = "argocd rollouts kustomize",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/refs/heads/main/schema/argo_rollouts_kustomize_schema.json",
          -- },
          -- {
          --   fileMatch = "",
          --   name = "argocd workflow kustomize",
          --   url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/refs/heads/main/schema/argo_workflows_kustomize_schema.json",
          -- },
        },
      }),
    },
  },
}
