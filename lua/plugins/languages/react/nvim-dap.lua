---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.react")()
  end,
  optional = true,
}
