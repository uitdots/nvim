---@type LazySpec
return {
  "max397574/better-escape.nvim",
  enabled = false,
  event = "InsertEnter",
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
