local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

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
    g.db_ui_execute_on_save = 0
    g.db_ui_use_nerd_fonts = 1
    g.vim_dadbod_completion_mark = ""
    g.db_ui_use_nvim_notify = 1
    g.db_ui_show_help = 0
    g.db_ui_show_database_icon = 1
    g.db_ui_disable_progress_bar = 1
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
      desc = "DBUI | Toggle DBUI",
      silent = true,
    },
  },
  config = function()
    -- when this issue is closed: https://github.com/kristijanhusak/vim-dadbod-ui/issues/344
    autocmd("FileType", {
      pattern = {
        "jq",
        "redis",
      },
      callback = function()
        map("n", "<Leader>W", "<Plug>(DBUI_SaveQuery)", { desc = "DBUI | Save Query", silent = true })
        map("n", "<Leader>E", "<Plug>(DBUI_EditBindParameters)", { desc = "DBUI | Edit Bind Parameters", silent = true })
        map("n", "<Leader>S", "<Plug>(DBUI_ExecuteQuery)", { desc = "DBUI | Execute Query", silent = true })
        map("v", "<Leader>S", "<Plug>(DBUI_ExecuteQuery)", { desc = "DBUI | Execute Query", silent = true })
      end,
    })
  end,
  dependencies = "tpope/vim-dadbod",
}
