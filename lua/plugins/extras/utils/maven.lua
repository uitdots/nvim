---@type NvPluginSpec
return {
  "eatgrass/maven.nvim",
  optional = true,
  opts = {},
  cmd = {
    "Maven",
    "MavenExec",
  },
  keys = {
    {
      "<Leader>lM",
      "<cmd>Maven<CR>",
      desc = "LPS | Maven",
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
