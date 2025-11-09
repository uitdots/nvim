---@type LazySpec
return {
  "MonsieurTib/neonuget",
  cmd = "NuGet",
  keys = {
    {
      "<localleader>ln",
      "<cmd>NuGet<CR>",
      desc = "LPS | NuGet",
    },
  },
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
