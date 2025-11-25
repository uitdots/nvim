-- FIXME: What the deps hell

---@type LazySpec
return {
  "theHamsta/nvim-dap-virtual-text",
  enabled = true,
  config = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
  },
  keys = {
    {
      "<leader>dv",
      function()
        require("nvim-dap-virtual-text").toggle()
      end,
      desc = "Dap Virtual Text | Toggle",
    },
  },
  specs = {
    {
      "mfussenegger/nvim-dap",
      dependencies = "theHamsta/nvim-dap-virtual-text",
    },
  },
}
