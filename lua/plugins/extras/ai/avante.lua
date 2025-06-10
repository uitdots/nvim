local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
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
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      enabled = false,
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      "OXY2DEV/markview.nvim",
      optional = true,
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "Avante",
          command = "Markview enable",
        })
      end,
    },
  },
}
