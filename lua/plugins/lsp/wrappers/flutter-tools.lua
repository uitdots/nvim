---@type NvPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  enabled = true,
  cond = vim.fn.executable("dart") == 1,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
    {
      "nvim-telescope/telescope.nvim",
      opts = function(_, opts)
        opts.extensions_list = vim.list_extend(opts.extensions_list or {}, { "flutter" })
      end,
    },
  },
  opts = {
    border = "rounded",
    lsp = {
      on_attach = function(client, bufnr)
        require("configs.lspconfig").on_attach(client, bufnr)
      end,
      capabilities = function(client, bufnr)
        require("configs.lspconfig").capabilities(client, bufnr)
      end,
      on_init = function(client, bufnr)
        require("configs.lspconfig").on_init(client, bufnr)
      end,
    },
    setting = {
      analysisExcludedFolders = {
        vim.g.is_windows and vim.fn.expand("$HOME/AppData/Local/Pub/Cache") or nil,
      },
    },
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      },
    },
  },
}
