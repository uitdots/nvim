---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "spectral",
  schema = "registry+v1",
  description = "A flexible JSON/YAML linter for creating automated style guides, with baked in support for OpenAPI (v3.1, v3.0, and v2.0), Arazzo v1.0, as well as AsyncAPI v2.x.",
  homepage = "https://stoplight.io/spectral",
  licenses = {
    "Apache-2.0 license",
  },
  languages = {
    "json",
    "yaml",
  },
  categories = {
    "Linter",
  },
  source = {
    id = "pkg:npm/@stoplight/spectral-cli@6.15.0",
  },
  bin = {
    ["spectral"] = "npm:spectral",
  },
}
