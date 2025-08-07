---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Git | Preview Hunk",
      silent = true,
    },
    {
      "<leader>gj",
      function()
        require("gitsigns").nav_hunk("next")
      end,
      desc = "Git | Next Hunk",
      silent = true,
    },
    {
      "<leader>gk",
      function()
        require("gitsigns").nav_hunk("prev")
      end,
      desc = "Git | Prev Hunk",
      silent = true,
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Git | Blame Line",
      silent = true,
    },
  },
  opts = {
    current_line_blame_opts = {
      delay = 200,
    },
  },
}
