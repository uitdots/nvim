---@type NvPluginSpec
return {
  "dstein64/nvim-scrollview",
  enabled = false,
  opts = {
    excluded_filetypes = {
      "NvimTree",
    },
  },
  keys = {
    { "<leader>o<C-s>", "<cmd>ScrollViewToggle<cr>", desc = "Scrollview | Toggle", silent = true },
  },
}
