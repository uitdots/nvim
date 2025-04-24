---@type NvPluginSpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  event = "LspAttach",
  init = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
  opts = {
    options = {
      overflow = {
        mode = "wrap", ---@type "wrap" | "none" | "oneline"
      },
    },
  },
}
