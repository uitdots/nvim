-- I don't know how to config this :v Maybe we should manully custom our dap
---@type LazySpec
return {
  "jay-babu/mason-nvim-dap.nvim",
  enabled = true,
  opts = {},
  dependencies = {
    "mfussenegger/nvim-dap",
    "mason-org/mason.nvim",
  },
}
