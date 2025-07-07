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
  specs = {
    {
      "mfussenegger/nvim-dap",
      dependencies = "theHamsta/nvim-dap-virtual-text",
    },
  },
}
