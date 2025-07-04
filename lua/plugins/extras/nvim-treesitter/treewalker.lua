---@type NvPluginSpec
return {
  "aaronik/treewalker.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
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
    },
    {
      "<leader>tj",
      "<cmd>Treewalker Down<CR>",
      desc = "Treewalker | Down",
      silent = true,
    },
    {
      "<leader>th",
      "<cmd>Treewalker Left<CR>",
      desc = "Treewalker | Left",
      silent = true,
    },
    {
      "<leader>tl",
      "<cmd>Treewalker Right<CR>",
      desc = "Treewalker | Right",
      silent = true,
    },
  },
  opts = {},
}
