---@type LazySpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = true,
  opts = {
    options = {
      overflow = {
        mode = "wrap", ---@type "wrap" | "none" | "oneline"
      },
    },
  },
  specs = {
    {
      "neovim/nvim-lspconfig",
      dependencies = "rachartier/tiny-inline-diagnostic.nvim",
    },
  },
}
