---@type LazySpec
return {
  "yochem/jq-playground.nvim",
  cmd = "JqPlayground",
  keys = {
    {
      "<leader>qj",
      "<cmd>JqPlayground<CR>",
      desc = "Query | Json",
      silent = true,
      ft = {
        "json",
        "jsonc",
        "json5",
      },
    },
  },
}
