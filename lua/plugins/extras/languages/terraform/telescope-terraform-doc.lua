---@type LazySpec
return {
  "ANGkeith/telescope-terraform-doc.nvim",
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = {
          "terraform_doc",
        },
      },
      opts_extend = {
        "extensions_list",
      },
      dependencies = "ANGkeith/telescope-terraform-doc.nvim",
    },
  },
}
