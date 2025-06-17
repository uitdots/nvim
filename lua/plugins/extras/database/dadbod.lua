---@type NvPluginSpec
return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      {
        "tpope/vim-dadbod",
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = {
          "sql",
          "mysql",
          "plsql",
        },
      },
      {
        "saghen/blink.cmp",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
          sources = {
            per_filetype = {
              sql = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "dadbod",
              },
            },
            providers = {
              dadbod = {
                name = "Dadbod",
                module = "vim_dadbod_completion.blink",
              },
            },
          },
        },
      },
    },
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
        "<leader>D",
        function()
          if vim.g.nvdash_displayed then
            require("nvchad.tabufline").close_buffer(vim.g.nvdash_buf)
          end
          vim.cmd("DBUIToggle")
        end,
        desc = "General | Toggle DBUI",
        silent = true,
      },
    },
  },
}
