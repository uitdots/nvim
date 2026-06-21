---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.node")()
  end,
  optional = true,
}
