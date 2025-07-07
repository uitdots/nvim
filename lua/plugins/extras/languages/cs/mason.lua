---@type LazySpec
return {
  "mason-org/mason.nvim",
  ---@module 'mason'
  ---@type MasonSettings
  opts = {
    registries = {
      "github:Crashdummyy/mason-registry",
    },
  },
  opts_extend = {
    "registries",
  },
  optional = true,
}
