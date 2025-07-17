---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  optional = true,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        textobjects = {
          select = {
            disable = {
              "dart",
            },
          },
        },
      },
      opts_extend = {
        "textobjects.select.disable",
      },
    },
  },
}
