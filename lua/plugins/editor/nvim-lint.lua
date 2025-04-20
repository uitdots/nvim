-- TODO: So...

---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    require("configs.editor.nvim-lint").setup()
  end,
}
