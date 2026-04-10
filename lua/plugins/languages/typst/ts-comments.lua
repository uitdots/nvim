---@type LazySpec
return {
  "folke/ts-comments.nvim",
  opts = {
    lang = {
      typst = { "// %s", "/* %s */" },
    },
  },
  optional = true,
}
