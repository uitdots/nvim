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
  opts = {
    profiles = {
      {
        name = "minimal",
        style = {
          placement = "inline",
          prefix = "",
        },
      },
    },
    limits = {
      exclude_append = {
        "*.lua",
        "*Dockerfile*",
      },
    },
  },
  event = "LspAttach",
}
