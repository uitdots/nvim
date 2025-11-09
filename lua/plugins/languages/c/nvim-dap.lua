---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.c")()
  end,
  optional = true,
}
