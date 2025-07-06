---@type NvPluginSpec
return {
  "nmac427/guess-indent.nvim",
  cmd = "GuessIndent",
  ---TODO: Still not know make it run when entering file with `nvim file_name`
  event = {
    "BufAdd",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>ui",
      "<cmd>GuessIndent<CR>",
      desc = "Utils | Fix Indent",
      silent = true,
    },
  },
  config = true,
}
