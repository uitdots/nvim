---@type LazySpec
return {
  "dstein64/nvim-scrollview",
  enabled = false,
  event = "VeryLazy",
  opts = {
    excluded_filetypes = {
      "NvimTree",
    },
  },
  keys = {
    {
      "<leader>o<C-s>",
      "<cmd>ScrollViewToggle<cr>",
      desc = "Scrollview | Toggle",
      silent = true,
    },
  },
}
