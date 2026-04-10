---@type LazySpec
return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = "*",
  keys = {
    {
      "<leader>wp",
      "<cmd>TypstPreviewToggle<CR>",
      desc = "Writing | Toggle Preview",
      ft = "typst",
    },
    {
      "<leader>wf",
      "<cmd>TypstPreviewFollowCursorToggle<CR>",
      desc = "Writing | Toggle Follow Cursor",
      ft = "typst",
    },
  },
  opts = {
    dependencies_bin = {
      tinymist = "tinymist",
    },
  },
}
