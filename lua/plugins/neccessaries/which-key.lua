---@type NvPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = {
      no_overlap = false,
      border = vim.g.border_enabled and "rounded" or "none",
    },
    delay = function()
      return 500
    end,
    triggers = {
      { "<auto>", mode = "nxsot" },
      { "s", mode = "n" }, -- Enable show menu for "s" keymap, replace default nvim's behavior
    },
    spec = {
      { "<leader><C-d>", group = "Database", icon = "" },
      { "<leader><C-r>", group = "Refactor", icon = "󰮓", mode = { "n", "v" } },
      { "<leader>A", group = "API", icon = "󱂛" },
      { "<leader>T", group = "Tests", icon = "󰙨" },
      { "<leader>Y", group = "Yanky", icon = "", mode = { "n", "x" } },
      { "<leader>a", group = "AI", icon = "", mode = { "n", "v" } },
      { "<leader>d", group = "Debugging", icon = "" },
      { "<leader>f", group = "Find", icon = "" },
      { "<leader>g", group = "Git", icon = "󰊢" },
      { "<leader>h", group = "Harpoon", icon = "" },
      { "<leader>l", group = "LSP", icon = "", mode = { "n", "v" } },
      { "<leader>m", group = "Markdown", icon = "" },
      { "<leader>n", group = "Neovim", icon = "" },
      { "<leader>o", group = "Options", icon = "" },
      { "<leader>p", group = "Plugins", icon = "" },
      { "<leader>r", group = "Runner", icon = "" },
      { "<leader>s", group = "Sessions", icon = "󰔚" },
      { "<leader>s", group = "Snapshot", icon = "", mode = { "x" } },
      { "<leader>S", group = "Search", icon = "󱈅", mode = { "n" } },
      { "<leader>t", group = "Terminal", icon = "" },
      { "<leader>u", group = "Utils", icon = "", mode = { "n", "v" } },
      { "<leader>v", group = "Venv", icon = "" },
      { "<leader>z", group = "Zen", icon = "󰡌" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
