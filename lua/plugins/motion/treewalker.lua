---@type LazySpec
return {
  "aaronik/treewalker.nvim",
  cmd = "Treewalker",
  keys = {
    {
      "<M-S-k>",
      "<cmd>Treewalker SwapUp<CR>",
      desc = "Treewalker | Swap Up",
      silent = true,
    },
    {
      "<M-S-j>",
      "<cmd>Treewalker SwapDown<CR>",
      desc = "Treewalker | Swap Down",
      silent = true,
    },
    {
      "<M-S-h>",
      "<cmd>Treewalker SwapLeft<CR>",
      desc = "Treewalker | Swap Left",
      silent = true,
    },
    {
      "<M-S-l>",
      "<cmd>Treewalker SwapRight<CR>",
      desc = "Treewalker | Swap Right",
      silent = true,
    },
    {
      "<leader>tk",
      "<cmd>Treewalker Up<CR>",
      desc = "Treewalker | Up",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>tj",
      "<cmd>Treewalker Down<CR>",
      desc = "Treewalker | Down",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>th",
      "<cmd>Treewalker Left<CR>",
      desc = "Treewalker | Left",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>tl",
      "<cmd>Treewalker Right<CR>",
      desc = "Treewalker | Right",
      silent = true,
      mode = { "n", "v" },
    },
  },
  config = true,
}
