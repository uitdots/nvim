---@type LazySpec
return {
  "ovk/endec.nvim",
  event = "VeryLazy",
  opts = {
    popup = {
      border = vim.o.winborder,
      transparency = vim.o.winblend,
    },
  },
}
