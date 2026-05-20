---@type LazySpec
return {
  "dmtrKovalenko/fff.nvim",
  lazy = false,
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  ---@module 'fff'
  ---@type FffConfig
  opts = {
    prompt = "> ",
    layout = {
      prompt_position = "top",
    },
    keymaps = {
      close = { "<C-c>" },
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fff").find_files()
      end,
      desc = "FFF | Files",
    },
    {
      "<leader>fg",
      function()
        require("fff").live_grep()
      end,
      desc = "FFF | Grep",
    },
    {
      "<leader>fz",
      function()
        require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
      end,
      desc = "FFF | Live FFFuzy Grep",
    },
    {
      "<leader>fs",
      function()
        require("fff").live_grep({ query = vim.fn.expand("<cword>") })
      end,
      desc = "FFF | Search String",
    },
  },
}
