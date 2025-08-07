---@module 'which-key'

---@type LazySpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Opts
  opts = {
    preset = "modern",
    show_help = false,
    win = {
      no_overlap = false,
    },
    delay = 500,
    spec = {
      { "<leader><C-t>", group = "Terminal", icon = { icon = "", color = "green" } },
      { "<leader>R", group = "Refactor", mode = { "n", "v" }, icon = { icon = "󰮓", color = "purple" } },
      { "<leader>T", group = "Test", icon = { icon = "󰙨", color = "yellow" } },
      { "<leader>a", group = "AI", mode = { "n", "v" }, icon = { icon = "", color = "purple" } },
      { "<leader>d", group = "Debug", icon = { icon = "", color = "yellow" } },
      { "<leader>f", group = "Find & File", mode = { "n", "v" }, icon = { icon = "", color = "red" } },
      { "<leader>g", group = "Git", mode = { "n", "v" }, icon = { icon = "󰊢", color = "red" } },
      { "<leader>l", group = "LSP", mode = { "n", "v" }, icon = { icon = "", color = "yellow" } },
      { "<leader>la", group = "LSP Action", mode = { "n", "v" }, icon = { icon = "", color = "yellow" } },
      { "<leader>m", group = "Markdown", icon = { icon = "", color = "cyan" } },
      { "<leader>n", group = "Neovim", icon = { icon = "", color = "green" } },
      { "<leader>o", group = "Options", icon = { icon = "", color = "green" } },
      { "<leader>p", group = "Plugins", icon = { icon = "", color = "green" } },
      { "<leader>q", group = "Query", icon = { icon = "󰩉", color = "cyan" } },
      { "<leader>r", group = "Runner", icon = { icon = "", color = "yellow" } },
      { "<leader>s", group = "Session", mode = "n", icon = { icon = "󰔚", color = "grey" } },
      { "<leader>s", group = "Snapshot", mode = "x", icon = { icon = "", color = "grey" } },
      { "<leader>t", group = "Treesitter", mode = { "n", "v" }, icon = { icon = "", color = "yellow" } },
      { "<leader>u", group = "Utils", mode = { "n", "v" }, icon = { icon = "", color = "blue" } },
      { "<localleader>\\", group = "Multi Cursor", icon = { icon = "󰗧", color = "purple" } },
      { "<localleader>l", group = "Latex", icon = { icon = "", color = "cyan" } },
      { "<localleader>s", group = "SQL", icon = { icon = "", color = "cyan" } },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "General | Local Key Help",
    },
    {
      "<leader><C-?>",
      function()
        require("which-key").show()
      end,
      desc = "General | Key Help",
    },
  },
}
