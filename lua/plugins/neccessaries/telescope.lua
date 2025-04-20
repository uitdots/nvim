---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  optional = true,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    extensions_list = {
      "fzf",
    },
    defaults = {
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules", "\\.git/", "\\.git\\" },
    },
  },
}
