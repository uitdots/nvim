---@type LazySpec
return {
  "oribarilan/lensline.nvim",
  keys = {
    {
      "<leader>l<C-l>",
      "<cmd>LenslineToggleView<CR>",
      desc = "LSP | Toggle Lens",
      silent = true,
    },
  },
  config = true,
  event = "LspAttach",
}
