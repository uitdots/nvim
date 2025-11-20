---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "formattag",
  schema = "registry+v1",
  description = "Align Golang struct tags",
  homepage = "https://github.com/momaek/formattag",
  licenses = {},
  languages = {
    "Go",
  },
  categories = {
    "Formatter",
  },
  source = {
    id = "pkg:golang/github.com/momaek/formattag@v0.0.10",
  },
  bin = {
    formattag = "golang:formattag",
  },
}
