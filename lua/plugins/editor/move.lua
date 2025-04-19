---@type NvPluginSpec
return {
  "fedepujol/move.nvim",
  cmd = {
    "MoveBlock",
    "MoveHBlock",
    "MoveWord",
    "MoveLine",
  },
  keys = {
    { "<M-j>", "<cmd>MoveLine(1)<CR>", desc = "Move | Line Down", noremap = true, silent = true },
    { "<M-k>", "<cmd>MoveLine(-1)<CR>", desc = "Move | Line Up", noremap = true, silent = true },
    { "<M-l>", "<cmd>MoveWord(1)<CR>", desc = "Move | Word Right", noremap = true, silent = true },
    { "<M-h>", "<cmd>MoveWord(-1)<CR>", desc = "Move | Word Left", noremap = true, silent = true },
    -- Visual-mode commands
    { "<M-j>", "<cmd>MoveBlock(1)<CR>", desc = "Move | Block Down", noremap = true, silent = true },
    { "<M-k>", "<cmd>MoveBlock(-1)<CR>", desc = "Move | Block Up", noremap = true, silent = true },
    { "<M-h>", "<cmd>MoveHBlock(-1)<CR>", desc = "Move | Block Left", noremap = true, silent = true },
    { "<M-l>", "<cmd>MoveHBlock(1)<CR>", desc = "Move | Block Right", noremap = true, silent = true },
  },
  config = true,
}
