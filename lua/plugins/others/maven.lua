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
      "<localleader>jm",
      "<cmd>Maven<CR>",
      desc = "Java | Maven",
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
