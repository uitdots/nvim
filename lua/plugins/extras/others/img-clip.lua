---@type LazySpec
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>up",
      "<cmd>PasteImage<CR>",
      desc = "Utils | Paste Image from System Clipboard",
    },
  },
  config = true,
}
