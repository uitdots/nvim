local is_executable = require("utils.executable").is_executable_cache

---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  enabled = is_executable("npm"),
  keys = {
    {
      "<leader>am",
      "<cmd>MCPHub<CR>",
      desc = "AI | MCPHub",
      silent = true,
    },
  },
  opts = {
    auto_approve = false,
    auto_toggle_mcp_servers = true,
    ui = {
      window = {
        border = vim.o.winborder,
      },
    },
  },
  build = "npm install -g mcp-hub@latest",
  dependencies = "nvim-lua/plenary.nvim",
  specs = {
    {
      "olimorris/codecompanion.nvim",
      opts = {
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
          },
        },
      },
      dependencies = "ravitemer/mcphub.nvim",
      optional = true,
    },
  },
}
