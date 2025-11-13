---@type LazySpec
return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fT",
      function()
        ---@diagnostic disable-next-line: undefined-field
        Snacks.picker.todo_comments()
      end,
      desc = "Snacks | Todo",
      silent = true,
    },
    {
      "]<M-t>",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Todo | Next",
    },
    {
      "[<M-t>",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Todo | Prev",
    },
  },
  config = true,
  dependencies = "folke/snacks.nvim",
}
