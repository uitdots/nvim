---@type NvPluginSpec
return {
  "yochem/jq-playground.nvim",
  cmd = "JqPlayground",
  keys = {
    {
      "<leader>qj",
      "<cmd>JqPlayground<CR>",
      desc = "Query API | Json",
      silent = true,
      ft = {
        "json",
        "jsonc",
        "json5",
      },
    },
  },
}
