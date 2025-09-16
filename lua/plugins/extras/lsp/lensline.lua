---@type LazySpec
return {
  "oribarilan/lensline.nvim",
  tag = "1.1.2",
  keys = {
    {
      "<leader>l<C-l>",
      "<cmd>LenslineToggleView<CR>",
      desc = "LSP | Toggle Lens",
      silent = true,
    },
  },
  opts = {
    style = {
      prefix = "",
      placement = "inline",
    },
  },
  event = "LspAttach",
}
