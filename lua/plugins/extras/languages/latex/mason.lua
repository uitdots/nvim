---@type LazySpec
return {
  "mason-org/mason.nvim",
  ---@module 'mason'
  ---@type MasonSettings
  opts = {
    registries = {
      "lua:configs.mason.registries.latexindent",
    },
  },
  opts_extend = {
    "registries",
  },
  optional = true,
}
