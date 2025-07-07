local is_executable = require("utils.executable").is_executable_cache
local border_enabled = require("preferences").options.ui.border_enabled

---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  cond = is_executable("npm"),
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
        border = border_enabled and "rounded" or "none", ---@type "none" | "single" | "double" | "rounded" | "solid" | "shadow"
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
            opts = {
              show_result_in_chat = true,
              make_vars = true,
              make_slash_commands = true,
            },
          },
        },
      },
      dependencies = "ravitemer/mcphub.nvim",
      optional = true,
    },
  },
}
