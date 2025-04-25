local lspconfig = require("configs.lspconfig")
local is_executable = require("core.utils").is_executable

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
