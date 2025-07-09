---@type LazySpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    options = {
      overflow = {
        mode = "wrap", ---@type "wrap" | "none" | "oneline"
      },
    },
  },
}
