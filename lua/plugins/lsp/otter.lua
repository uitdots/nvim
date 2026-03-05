---@type LazySpec
return {
  "jmbuhr/otter.nvim",
  keys = {
    {
      "<leader>lO",
      function()
        require("otter").activate()
      end,
      desc = "LSP | Activate Otter",
      silent = true,
    },
    {
      "<leader>l<C-o>",
      function()
        require("otter").deactivate()
      end,
      desc = "LSP | Deactivate Otter",
      silent = true,
    },
  },
  ---@module 'otter'
  ---@type OtterConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    extensions = {
      plantuml = "plantuml",
    },
    verbose = {
      no_code_found = true,
    },
  },
  dependencies = "nvim-treesitter/nvim-treesitter",
}
