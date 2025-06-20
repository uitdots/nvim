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
      "<localleader>lm",
      "<cmd>Maven<CR>",
      desc = "LPS | Maven",
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
