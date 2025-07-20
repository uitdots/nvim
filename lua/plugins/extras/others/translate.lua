---@type LazySpec
return {
  "uga-rosa/translate.nvim",
  cmd = "Translate",
  keys = {
    {
      "<leader>ut",
      "<cmd>Translate vi<CR>",
      desc = "Utils | Translate",
      mode = "v",
      silent = true,
    },
  },
  opts = {
    preset = {
      output = {
        floating = {
          border = vim.o.winborder,
        },
      },
    },
    silent = true,
  },
}
