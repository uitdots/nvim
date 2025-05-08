local lspconfig = require("configs.lsp.lspconfig")
local is_executable = require("utils.executable").is_executable
local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  enabled = true,
  cond = is_executable("dart"),
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
      capabilities = lspconfig.capabilities,
      on_init = lspconfig.on_init,
      on_attach = lspconfig.on_attach,
    },
    setting = {
      analysisExcludedFolders = {
        is_windows and vim.fn.expand("$HOME/AppData/Local/Pub/Cache") or nil,
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
