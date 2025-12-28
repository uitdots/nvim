---@type LazySpec
return {
  "mason-org/mason.nvim",
  ---@module 'mason'
  ---@type MasonSettings
  opts = {
    registries = {
      "lua:configs.mason.registries.java",
    },
  },
  opts_extend = {
    "registries",
  },
  optional = true,
}
