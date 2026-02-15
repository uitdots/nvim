---@type LazySpec
return {
  "aikhe/wrapped.nvim",
  cmd = "NvimWrapped",
  keys = {
    {
      "<leader>uW",
      "<cmd>NvimWrapped<CR>",
      desc = "Wrapped | Open",
      silent = true,
    },
  },
  dependencies = "nvzone/volt",
  config = true,
}
