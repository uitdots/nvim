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
      desc = "GitSigns | Inline Preview Hunk",
      silent = true,
    },
    {
      "<leader>gP",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "GitSigns | Preview Hunk",
      silent = true,
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "GitSigns | Blame Line",
      silent = true,
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "GitSigns | Blame Line",
      silent = true,
    },
    {
      "<leader>gh",
      function()
        require("gitsigns").select_hunk()
      end,
      desc = "GitSigns | Select Hunk",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "GitSigns | Stage Hunk",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "GitSigns | Stage Hunk",
      silent = true,
      mode = "v",
    },
    {
      "<leader>gS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "GitSigns | Stage Buffer",
      silent = true,
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "GitSigns | Reset Hunk",
      silent = true,
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      desc = "GitSigns | Reset Hunk",
      silent = true,
      mode = "v",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "GitSigns | Reset Buffer",
      silent = true,
    },
    {
      "<leader>gw",
      function()
        require("gitsigns").toggle_word_diff()
      end,
      desc = "GitSigns | Word Diff",
      silent = true,
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "GitSigns | Diff",
      silent = true,
    },
    {
      "<leader>gD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "GitSigns | Diff Last Commit",
      silent = true,
    },
    {
      "<leader>gj",
      function()
        require("gitsigns").nav_hunk("next")
      end,
      desc = "GitSigns | Next Hunk",
      silent = true,
    },
    {
      "<leader>gk",
      function()
        require("gitsigns").nav_hunk("prev")
      end,
      desc = "GitSigns | Previous Hunk",
      silent = true,
    },
  },
  opts = {
    signs_staged_enable = false,
    signcolumn = false,
    numhl = true,
    watch_gitdir = {
      follow_files = false,
    },
    current_line_blame_opts = {
      delay = 200,
    },
  },
}
