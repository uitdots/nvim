---@type NvPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  enabled = true,
  opts = {
    enabled = false,
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
