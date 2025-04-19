---@type NvPluginSpec
return {
  "max397574/better-escape.nvim",
  event = "VeryLazy",
  opts = {
    default_mappings = false,
    mappings = {
      i = {
        j = {
          k = "<Esc>",
        },
      },
    },
  },
  main = "better_escape",
}
