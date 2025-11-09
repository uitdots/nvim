---@type LazySpec
return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_maps = {
      ["I Return"] = "<S-CR>",
      ["Add Cursor Up"] = "<C-PageUp>", -- <C-Up> is for resize windows
      ["Add Cursor Down"] = "<C-PageDown>", -- <C-Down> is for resize windows
    }
  end,
}
