---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  opts = {
    extensions_list = {
      "fzf",
    },
  },
  opts_extend = {
    "extensions_list",
  },
}
