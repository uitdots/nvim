---@type NvPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  enabled = true,
  event = "LspAttach",
  keys = {
    {
      "<leader>ll",
      "<cmd>LspLensToggle<cr>",
      desc = "LSP | Toggle Lens",
      silent = true,
    },
  },
}
