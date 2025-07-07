---@type LazySpec
return {
  "cappyzawa/telescope-terraform.nvim",
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = {
          "terraform",
        },
      },
      opts_extend = {
        "extensions_list",
      },
      dependencies = "cappyzawa/telescope-terraform.nvim",
    },
  },
}
