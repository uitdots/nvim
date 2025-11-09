---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.javascript")()
  end,
  optional = true,
}
