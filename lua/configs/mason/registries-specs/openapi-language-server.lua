---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "openapi-language-server",
  schema = "registry+v1",
  description = "OpenAPI language server for LSP compatible code editors",
  homepage = "https://github.com/armsnyder/openapi-language-server",
  licenses = {
    "MIT",
  },
  languages = {
    "openapi",
  },
  categories = {
    "LSP",
  },
  source = {
    id = "pkg:golang/github.com/armsnyder/openapi-language-server@v0.2.2",
  },
  bin = {
    ["openapi-language-server"] = "golang:openapi-language-server",
  },
  neovim = {
    lspconfig = "openapi_ls",
  },
}
