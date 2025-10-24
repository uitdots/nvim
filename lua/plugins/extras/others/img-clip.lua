---@type LazySpec
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>up",
      "<cmd>PasteImage<CR>",
      desc = "ImgClip | Paste from S-Clip",
    },
  },
  opts = {
    default = {
      verbose = false,
    },
  },
}
