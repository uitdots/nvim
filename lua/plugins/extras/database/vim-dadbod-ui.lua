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
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_show_database_icon = 1
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
  config = function() end, -- For other to hook with lazy's opts, which will trigger config
  dependencies = "tpope/vim-dadbod",
}
