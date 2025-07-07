---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.javascriptreact").setup()
    require("configs.dap.configurations.typescriptreact").setup()
  end,
  optional = true,
}
