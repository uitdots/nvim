---@type LazySpec
return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = {
          "fzf",
        },
      },
      opts_extend = {
        "extensions_list",
      },
      dependencies = "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
}
