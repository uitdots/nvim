---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "swaggo_ls",
  schema = "registry+v1",
  description = "Swaggo for IDE",
  homepage = "https://github.com/takaaa220/swaggo-ide",
  licenses = {},
  languages = {
    "go",
  },
  categories = {
    "LSP",
  },
  source = {
    -- renovate:extractVersion=^swaggo-language-server-v(?<version>.+)$
    id = "pkg:golang/github.com/takaaa220/swaggo-ide/swaggo-language-server@swaggo-language-server-v0.0.3",
    -- id = "pkg:golang/github.com/takaaa220/swaggo-ide/swaggo-language-server@latest",
  },
  bin = {
    ["swaggo-language-server"] = "golang:swaggo-language-server",
  },
  neovim = {
    lspconfig = "swaggo_ls",
  },
}
