---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>lf",
      "<cmd>Format<cr>",
      desc = "LSP | Format",
      silent = true,
    },
    {
      "<leader>lF",
      "<cmd>FormatToggle<cr>",
      desc = "LSP | Toggle Autoformat",
      silent = true,
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    lsp_format = "fallback",
    formatters = {
      prettier = {
        append_args = {
          "--ignore-gitignore", -- Format file which ignored by .gitignore
        },
      },
    },
    format_after_save = function(bufnr) -- Async format
      -- Disable with a global or buffer-local variable
      if not vim.g.autoformat_enabled or not vim.b[bufnr].autoformat_enabled then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
        return
      end
      return {}
    end,
  },
  config = function(_, opts)
    require("configs.editor.conform").setup(opts)
  end,
}
