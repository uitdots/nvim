---@type NvPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  enabled = true,
  event = "LspAttach",
  opts = {
    enabled = true,
  },
  cmd = {
    "LspLensToggle",
  },
  keys = {
    {
      "<leader>ll",
      "<cmd>LspLensToggle<cr>",
      desc = "LSP | Toggle Lens",
      silent = true,
    },
  },
}
