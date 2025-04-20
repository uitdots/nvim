---@type NvPluginSpec
return {
  "lambdalisue/vim-suda",
  cond = not vim.is_windows,
  cmd = {
    "SudaWrite",
    "SudaRead",
  },
  keys = {
    {
      "<leader>u<C-s>",
      "<cmd>SudaWrite<cr>",
    },
  },
}
