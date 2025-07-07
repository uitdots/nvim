---@type LazySpec
return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.vim_dadbod_completion_mark = ""
  end,
  keys = {
    {
      "<leader>qd",
      function()
        if vim.g.nvdash_displayed then
          require("nvchad.tabufline").close_buffer(vim.g.nvdash_buf)
        end
        vim.cmd("DBUIToggle")
      end,
      desc = "Query | Toggle DBUI",
      silent = true,
    },
  },
  dependencies = {
    "tpope/vim-dadbod",
    {
      "kristijanhusak/vim-dadbod-completion",
      optional = true,
    },
    {
      "saghen/blink.cmp",
      optional = true,
    },
  },
}
