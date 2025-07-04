---@type NvPluginSpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = true,
  ---https://github.com/rachartier/tiny-inline-diagnostic.nvim/issues/112
  event = "VeryLazy",
  opts = {
    options = {
      overflow = {
        mode = "wrap", ---@type "wrap" | "none" | "oneline"
      },
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
  },
}
