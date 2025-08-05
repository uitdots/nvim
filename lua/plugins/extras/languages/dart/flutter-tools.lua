local lsp = require("configs.lsp")
local is_executable = require("utils.executable").is_executable
local is_windows = require("utils.os").is_windows
local home = require("utils.os").home

---@type LazySpec
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
    -- TODO: Do we have to declare ourselves?
    border = "rounded",
    lsp = {
      capabilities = lsp.capabilities,
      on_init = lsp.on_init,
    },
    setting = {
      analysisExcludedFolders = {
        is_windows and home .. "/AppData/Local/Pub/Cache" or nil,
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
