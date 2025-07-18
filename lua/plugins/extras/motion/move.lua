---@type LazySpec
return {
  "fedepujol/move.nvim",
  cmd = {
    "MoveBlock",
    "MoveHBlock",
    "MoveWord",
    "MoveLine",
  },
  -- LazyNvim keys doesn't work
  init = function()
    -- Normal-mode commands
    vim.keymap.set("n", "<M-j>", ":MoveLine(1)<cr>", { desc = "General | Move Line Down", noremap = true, silent = true })
    vim.keymap.set("n", "<M-k>", ":MoveLine(-1)<cr>", { desc = "General | Move Line Up", noremap = true, silent = true })
    vim.keymap.set("n", "<M-l>", ":MoveWord(1)<cr>", { desc = "General | Move Word Right", noremap = true, silent = true })
    vim.keymap.set("n", "<M-h>", ":MoveWord(-1)<cr>", { desc = "General | Move Word Left", noremap = true, silent = true })

    -- Visual-mode commands
    vim.keymap.set("v", "<M-j>", ":MoveBlock(1)<cr>", { desc = "General | Move Block Down", noremap = true, silent = true })
    vim.keymap.set("v", "<M-k>", ":MoveBlock(-1)<cr>", { desc = "General | Move Block Up", noremap = true, silent = true })
    vim.keymap.set("v", "<M-h>", ":MoveHBlock(-1)<cr>", { desc = "General | Move Block Left", noremap = true, silent = true })
    vim.keymap.set("v", "<M-l>", ":MoveHBlock(1)<cr>", { desc = "General | Move Block Right", noremap = true, silent = true })
  end,
  config = true,
}
