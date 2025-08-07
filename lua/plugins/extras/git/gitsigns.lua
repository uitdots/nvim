---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "Git | Inline Preview Hunk",
      silent = true,
    },
    {
      "<leader>gP",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Git | Preview Hunk",
      silent = true,
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Git | Blame Line",
      silent = true,
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Git | Blame Line",
      silent = true,
    },
    {
      "<leader>gh",
      function()
        require("gitsigns").select_hunk()
      end,
      desc = "Git | Select Hunk",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Git | Stage Hunk",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "Git | Stage Hunk",
      silent = true,
      mode = "v",
    },
    {
      "<leader>gS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Git | Stage Buffer",
      silent = true,
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Git | Reset Hunk",
      silent = true,
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "Git | Reset Hunk",
      silent = true,
      mode = "v",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Git | Reset Buffer",
      silent = true,
    },
    {
      "<leader>gw",
      function()
        require("gitsigns").toggle_word_diff()
      end,
      desc = "Git | Word Diff",
      silent = true,
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Git | Diff",
      silent = true,
    },
    {
      "<leader>gD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Git | Diff Last Commit",
      silent = true,
    },
  },
  opts = {
    signs_staged_enable = false,
    signcolumn = false,
    watch_gitdir = {
      follow_files = false,
    },
    current_line_blame_opts = {
      delay = 200,
    },
  },
}
