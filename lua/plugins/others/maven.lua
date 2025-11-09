---@type LazySpec
return {
  "eatgrass/maven.nvim",
  optional = true,
  config = true,
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
