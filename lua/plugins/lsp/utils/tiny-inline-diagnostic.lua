---@type NvPluginSpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = true,
  event = "LspAttach",
  opts = {
    options = {
      overflow = {
        mode = "wrap", ---@type "wrap" | "none" | "oneline"
      },
    },
  },
}
