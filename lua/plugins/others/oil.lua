---@type LazySpec
return {
  "stevearc/oil.nvim",
  keys = {
    {
      "-",
      "<CMD>Oil --float<CR>",
      desc = "Oil | Toggle",
      silent = true,
    },
  },
  cmd = "Oil",
  ---@module 'oil'
  ---@type oil.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    view_options = {
      show_hidden = true,
    },
    ---@diagnostic disable-next-line: missing-fields
    float = {
      padding = 2,
      max_height = math.ceil(vim.o.lines * 0.8 - 4),
      max_width = math.ceil(vim.o.columns * 0.4),
    },
  },
}
