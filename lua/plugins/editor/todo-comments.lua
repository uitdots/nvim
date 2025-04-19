---@type NvPluginSpec
return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fT",
      "<cmd>TodoTelescope<cr>",
      desc = "Find | Todo",
      silent = true,
    },
  },
  config = true,
}
