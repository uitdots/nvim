---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "redocly",
  schema = "registry+v1",
  description = "Redocly VS Code extension",
  homepage = "https://github.com/Redocly/redocly-vs-code",
  licenses = {},
  languages = {
    "openapi",
  },
  categories = {
    "LSP",
  },
  source = {
    id = "pkg:openvsx/Redocly/openapi-vs-code@0.9.11",
    download = {
      file = "Redocly.openapi-vs-code-{{version}}.vsix",
    },
  },
  bin = {
    ["redocly-ls"] = "node:extension/out/server/src/server.js",
  },
  neovim = {
    lspconfig = "redocly_ls",
  },
}
