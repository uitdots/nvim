local autocmd = vim.api.nvim_create_autocmd
local is_windows = require("utils.os").is_windows

---@type LazySpec
return {
  "yetone/avante.nvim",
  enabled = false,
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "copilot", ---@type "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    behaviour = {
      auto_set_highlight_group = false, -- Use NvChad highlight I guess
      auto_set_keymaps = true,
      support_paste_from_clipboard = false,
    },
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>AvanteAsk<cr>",
      desc = "Avante | Ask",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>ac",
      "<cmd>AvanteChat<cr>",
      desc = "Avante | Chat",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>aT",
      "<cmd>AvanteToggle<cr>",
      desc = "Avante | Toggle",
      silent = true,
    },
  },
  build = is_windows and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "zbirenbaum/copilot.lua",
      optional = true,
    },
    {
      "HakonHarnes/img-clip.nvim",
      optional = true,
    },
    {
      "OXY2DEV/markview.nvim",
      optional = true,
    },
  },
  specs = {
    {
      "OXY2DEV/markview.nvim",
      opts = function(_, opts)
        autocmd("FileType", {
          pattern = "Avante",
          callback = function()
            vim.cmd("Markview enable")
            vim.cmd("Markview hybridEnable")
          end,
        })
        return opts
      end,
    },
  },
}
